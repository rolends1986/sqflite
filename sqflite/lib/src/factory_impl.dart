import 'dart:async';
import 'dart:io';

import 'package:math_sqflite/sqflite.dart';
import 'package:math_sqflite/src/exception_impl.dart' as impl;
import 'package:math_sqflite/src/factory.dart';
import 'package:math_sqflite/src/factory_mixin.dart';
import 'package:math_sqflite/src/open_options.dart';
import 'package:math_sqflite/src/sqflite_impl.dart' as impl;

export 'package:math_sqflite/src/open_options.dart';

SqfliteDatabaseFactory _databaseFactory;

DatabaseFactory get databaseFactory => sqlfliteDatabaseFactory;

SqfliteDatabaseFactory get sqlfliteDatabaseFactory =>
    _databaseFactory ??= SqfliteDatabaseFactoryImpl();

Future<Database> openReadOnlyDatabase(String path) async {
  final SqfliteOpenDatabaseOptions options =
      SqfliteOpenDatabaseOptions(readOnly: true);
  return sqlfliteDatabaseFactory.openDatabase(path, options: options);
}

class SqfliteDatabaseFactoryImpl with SqfliteDatabaseFactoryMixin {
  @override
  Future<T> wrapDatabaseException<T>(Future<T> action()) =>
      impl.wrapDatabaseException(action);

  @override
  Future<T> invokeMethod<T>(String method, [dynamic arguments]) =>
      impl.invokeMethod(method, arguments);

  /// Optimized but could be removed
  @override
  Future<void> deleteDatabase(String path) async {
    path = await fixPath(path);
    try {
      await File(path).delete(recursive: true);
    } catch (_) {
      // 0.8.4
      // print(_);
    }
  }

  /// Optimized but could be removed
  @override
  Future<bool> databaseExists(String path) async {
    path = await fixPath(path);
    try {
      // avoid slow async method
      return File(path).existsSync();
    } catch (_) {}
    return false;
  }
}
