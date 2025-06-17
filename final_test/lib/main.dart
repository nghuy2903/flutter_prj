
import 'package:final_test/Screens/page_forgot_password.dart';
import 'package:final_test/Screens/page_login.dart';
import 'package:final_test/Screens/page_register.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_test/DB/provider/user_provider.dart';

void main() async {
  // Đảm bảo Flutter được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  
  // Khởi tạo UserProvider
  final userProvider = UserProvider();
  
  // // Khởi tạo dữ liệu mẫu
  // final initData = InitData(userProvider);
  // await initData.initSampleData();

  // Kiểm tra lại danh sách user
  final allUsers = await userProvider.getAllUsers();
  userProvider.deleteUser(7);
  for (var user in allUsers) {
    print('ID: ${user.id}, Email: ${user.email}');
  }
  
  runApp(
    ChangeNotifierProvider.value(
      value: userProvider,
      child: const MyApp(),
    ),
  );
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