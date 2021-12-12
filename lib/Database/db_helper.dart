import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {

  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(
        path.join(dbpath, 'memories.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE memories(id TEXT PRIMARY KEY, title TEXT,description TEXT, image TEXT)');
        },
        version: 1

    );
  }

  static Future<void> insert(String table, Map<String, Object>data) async {
    //Replaces contents in preexisting row in database
    final db = await DBHelper.database();
    db.insert(
        table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}