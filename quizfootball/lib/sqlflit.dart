import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

static Database? _db;
Future<Database?> get db async {
  if(_db == null) {
    _db = await initialDb();
    return _db;
  }else {
    return _db;
  }
}

  initialDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'Islam.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUbgrade);
    return mydb;
  }

  _onUbgrade(Database db, int oldVersion, int newVersion) {

  }
  _onCreate(Database db , int version) async {
    await db.execute('''
CREATE TABLE "notes" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "player1" TEXT NOT NULL,
  "player2" TEXT NOT NULL,
  "result" TEXT NOT NULL
)
''');
  }
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(sql);
    return response;
  }
  insertData(String sql,Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(sql, values);
    return response;
  }
  updateData(String sql, Map<String, Object?> values, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.update(sql, values, where: where);
    return response;
  }
  deleteData(String sql, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.delete(sql, where: where);
    return response;
  }
  
  
}