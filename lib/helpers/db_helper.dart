import 'package:sqflite/sqflite.dart'as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';

class DbHelper{
  // insert into db
  static Future<void> insert (String table, Map<String, Object>data) async{
    final dbPath = await sql.getDatabasesPath(); // path for storing files
    final cur = await sql.openDatabase(path.join(dbPath, 'places.db'), onCreate: (db, version){
      return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version:1);
    await cur.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace, );
  }
}