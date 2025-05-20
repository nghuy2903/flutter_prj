import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL
          )
        ''');
        // Thêm tài khoản mặc định
        await db.insert('users', {'email': 'admin', 'password': '123'});
        List<Map<String, dynamic>> users = await db.query('users');
        print("Danh sách tài khoản: $users");
      },
    );
  }

  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // 🔥 Kiểm tra xem email & password có trùng với tài khoản đã lưu không
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    return (savedEmail == email && savedPassword == password);
  }

  Future<void> register(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  
}
