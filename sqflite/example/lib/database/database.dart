import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:math_sqflite/sqflite.dart';

// return the path
Future<String> initDeleteDb(String dbName) async {
  final String databasePath = await getDatabasesPath();
  // print(databasePath);
  final String path = join(databasePath, dbName);

  // make sure the folder exists
  if (await Directory(dirname(path)).exists()) {
    await deleteDatabase(path);
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e);
    }
  }
  return path;
}
