import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('email') == null) {
    await prefs.setString('email', 'admin');
    await prefs.setString('password', '123');
  }

  // Lấy dữ liệu đăng nhập từ SharedPreferences
  final String email = prefs.getString('email') ?? 'Unknown';
  final String role = prefs.getString('role') ?? 'User';

  runApp(MyApp(userData: {'fullname': email, 'role': role}));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic> userData;

  const MyApp({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(userData: userData), // ✅ Truyền userData
      },
    );
  }
}

