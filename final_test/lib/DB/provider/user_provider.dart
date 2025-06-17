import 'package:flutter/foundation.dart';
import 'package:final_test/DB/db/database_helper.dart';
import 'package:final_test/DB/model/user.dart';

class UserProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<User> _users = [];
  User? _currentUser;

  List<User> get users => _users;
  User? get currentUser => _currentUser;

  // Thêm user mới
  Future<int> insertUser(User user) async {
    final db = await _dbHelper.database;
    final id = await db.insert('users', user.toMap());
    _users.add(user);
    notifyListeners();
    return id;
  }

  // Lấy user theo email
  Future<User?> getUserByEmail(String email) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  // Kiểm tra đăng nhập
  Future<User?> login(String email, String password) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      _currentUser = User.fromMap(maps.first);
      notifyListeners();
      return _currentUser;
    }
    return null;
  }

  // Lấy tất cả users
  Future<List<User>> getAllUsers() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    _users = List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
    notifyListeners();
    return _users;
  }

  // Cập nhật user
  Future<int> updateUser(User user) async {
    final db = await _dbHelper.database;
    final result = await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
    
    // Cập nhật local state
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      if (_currentUser?.id == user.id) {
        _currentUser = user;
      }
      notifyListeners();
    }
    
    return result;
  }

  // Xóa user
  Future<int> deleteUser(int id) async {
    final db = await _dbHelper.database;
    final result = await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    // Cập nhật local state
    _users.removeWhere((user) => user.id == id);
    if (_currentUser?.id == id) {
      _currentUser = null;
    }
    notifyListeners();
    
    return result;
  }

  // Logout
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
} 