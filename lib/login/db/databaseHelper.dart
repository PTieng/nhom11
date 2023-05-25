import 'package:flutter_application_1/login/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static late Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT,  
        address TEXT,
        phone TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database dbClient = await db;
    return await dbClient.insert('User', user.toMap());
  }

  Future<User?> getUser(String username, String password) async {
    Database dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query(
      'User',
      where: 'name = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.length > 0) {
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<User?> getCurrentUser() async {
    Database dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query('User');
    if (result.length > 0) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
