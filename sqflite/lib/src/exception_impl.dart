import 'package:flutter/services.dart';
import 'package:math_sqflite/src/constant.dart';
import 'package:math_sqflite/src/exception.dart';

Future<T> wrapDatabaseException<T>(Future<T> action()) async {
  try {
    final T result = await action();
    return result;
  } on PlatformException catch (e) {
    if (e.code == sqliteErrorCode) {
      throw SqfliteDatabaseException(e.message, e.details);
      //rethrow;
    } else {
      rethrow;
    }
  }
}
