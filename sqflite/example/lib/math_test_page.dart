import 'package:math_sqflite/sqflite.dart';
import 'package:sqflite_example/test_page.dart';

class MathTestPage extends TestPage{
  MathTestPage( ) : super("math lib test"){

    var list=[
      "sqrt(16)",
      'acos(0.5)',
      'asin(0.5)',
      'atan(0.5)',
      'atn2(0,-1)',
      'atan2 (7,-7)',
      'acosh(6)',
      'asinh(1)',
      "difference('abc','aDCA')",
      'degrees(pi())',
      "charindex('abcd','b')",
      "ltrim(' abcd')",
      "replace('abcd','d','f')",
      "reverse('abcd')",
      "stdev(0.45)",
    ];

    list.forEach((item){
      test(item, () async {
        var db = await openDatabase(inMemoryDatabasePath);
        var results = await db.rawQuery('select $item');
        print(' $item = ${results.first.values.first}');
        await db.close();
      });
    });


  }


}