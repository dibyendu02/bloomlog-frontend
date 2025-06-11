// lib/main.dart
import 'package:bloomlog/core/local/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

Future<void> main() async {
  await HiveStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}
