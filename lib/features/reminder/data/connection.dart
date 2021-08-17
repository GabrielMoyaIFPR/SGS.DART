import 'package:path/path.dart';
import 'package:sgs/features/reminder/data/script.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database _db;

  static Future<Database> get() async {
    var path = join(await getDatabasesPath(), 'banco_sono');
    deleteDatabase(path);
    if (_db == null) {
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(createTableReminder);
          db.execute(createTableSleep);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
          db.execute(insert4);
          db.execute(insert5);
          db.execute(insert6);
        },
      );
    }
    return _db;
  }
}
