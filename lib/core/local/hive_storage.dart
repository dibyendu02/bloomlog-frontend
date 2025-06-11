import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/interfaces/local_storage_service.dart';

class HiveStorage implements LocalStorageService {
  static const _boxName = 'secure_box';

  static Future<void> init() async => Hive.initFlutter();
  static Future<Box> _box() => Hive.openBox(_boxName);

  @override
  Future<void> write(String key, dynamic value) async =>
      (await _box()).put(key, value);

  @override
  Future<T?> read<T>(String key) async => (await _box()).get(key) as T?;

  @override
  Future<void> delete(String key) async => (await _box()).delete(key);
}
