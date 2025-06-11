import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hive_storage.dart';
import '../../../core/interfaces/local_storage_service.dart';

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return HiveStorage();
});
