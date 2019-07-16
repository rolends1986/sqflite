import 'dart:async';
import 'dart:core';

import 'services_impl.dart';

export 'package:math_sqflite/src/collection_utils.dart';
export 'package:math_sqflite/src/utils.dart';



// Temp flag to test concurrent reads
final bool supportsConcurrency = false;

// Make it async safe for dart 2.0.0-dev28+ preview dart 2
Future<T> invokeMethod<T>(String method, [dynamic arguments]) async {
  final T result = await MethodChannel('com.tekartik.math_sqflite').invokeMethod(method, arguments) as T;
  return result;
}
