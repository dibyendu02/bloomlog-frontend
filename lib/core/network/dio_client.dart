import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/api_constants.dart';
import '../../core/interfaces/local_storage_service.dart';
import '../local/hive_storage_provider.dart'; // provides LocalStorageService

/// Riverpod provider – anyone can `ref.watch(dioClientProvider)` to get the
/// configured Dio client.

final dioClientProvider = Provider<DioClient>((ref) {
  // inject the *interface*; the provider decides which concrete impl to give
  final storage = ref.read(localStorageProvider);
  return DioClient(ref, storage);
});

class DioClient {
  DioClient(this._ref, this._storage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: ApiConstants.timeout),
        receiveTimeout: Duration(seconds: ApiConstants.timeout),
        headers: {
          'AppName': ApiConstants.appNameHeader,
          'SecretKey': ApiConstants.secretKeyHeader,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // ── DEV-only: allow self-signed certs ────────────────────────────────
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (
      HttpClient client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // ── Interceptors ────────────────────────────────────────────────────
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // read token from abstract storage
          final token = await _storage.read<String>('auth_token');

          if (token != null && ApiConstants.requiresAuth(options.path)) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ ${response.statusCode} ${response.requestOptions.uri}');
          handler.next(response);
        },
        onError: (error, handler) {
          print(
            '⛔️ ${error.response?.statusCode} '
            '${error.requestOptions.uri}',
          );
          print(error.message);
          handler.next(error);
        },
      ),
    );

    // Pretty logging (remove or wrap with kDebugMode in prod)
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────
  final Ref _ref;
  final LocalStorageService _storage;
  late final Dio _dio;

  Dio get dio => _dio;
}
