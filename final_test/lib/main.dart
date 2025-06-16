import 'package:final_test/MVC/db/database_helper.dart';
import 'package:final_test/MVC/db/user_dao.dart';
import 'package:final_test/Widget/page_forgot_password.dart';
import 'package:final_test/Widget/page_login.dart';
import 'package:final_test/Widget/page_register.dart';
import 'package:final_test/MVC/db/init_data.dart';
import 'package:flutter/material.dart';

void main() async {
  // Đảm bảo Flutter được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  
  // // Khởi tạo dữ liệu mẫu
  // final initData = InitData();
  // await initData.initSampleData();

  final userDao = UserDAO();

  // ✅ Kiểm tra lại danh sách user
  final allUsers = await userDao.getAllUsers();
  userDao.deleteUser(4);
  for (var user in allUsers) {
    print('ID: ${user.id}, Email: ${user.email}');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/forgot-password': (context) => FogotPasswordPage(),
        '/register': (context) => PageRegister(),
      },
    );
  }
}