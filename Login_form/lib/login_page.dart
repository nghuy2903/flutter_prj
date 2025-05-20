import 'package:flutter/material.dart';
import 'database_helper.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>(); 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  void login() async {
    
    //  if (!_formKey.currentState!.validate()) return;

    String email = emailController.text;
    String password = passwordController.text;
    bool isValid = await dbHelper.login(email, password);

    if (isValid) {
      Navigator.pushReplacementNamed(context, '/home'); // Chuyển sang HomePage
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sai tài khoản hoặc mật khẩu!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Ảnh nền
          Container(
            height: size.height * 0.27,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroud.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Nội dung đăng nhập
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo hình tròn
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Form đăng nhập
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Ô nhập Email
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email, color: Colors.blue),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Ô nhập Mật khẩu
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Mật khẩu',
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),

                        // Quên mật khẩu
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Nút Đăng nhập
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                       const SizedBox(height: 16),

                        // Đăng nhập Google & Facebook
                        Row(
                          children: [
                            // Nút Google
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Transform.scale(
                                  scale: 2, // Tăng kích thước icon mà không làm thay đổi button
                                  child: const Icon(
                                    Icons.g_mobiledata,
                                    size: 24, // Giữ icon nhỏ, chỉ phóng to bằng Transform
                                    color: Colors.white,
                                  ),
                                ),
                                label: const Text('Google'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  fixedSize: const Size.fromHeight(48), // Giữ chiều cao cố định cho button
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Nút Facebook
                            Expanded(
                              child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Transform.scale(
                                scale: 1.5, // Phóng to icon mà không ảnh hưởng button
                                child: const Icon(
                                  Icons.facebook,
                                  size: 24, // Giữ icon nhỏ, chỉ phóng to bằng Transform
                                  color: Colors.white,
                                ),
                              ),
                              label: const Text('Facebook'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4), // Bo góc nhẹ
                                ),
                                fixedSize: const Size.fromHeight(48), // Giữ chiều cao cố định cho button
                              ),
                            ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),
                        // Đăng ký tài khoản
                        TextButton(
                          onPressed: () {},
                          child: const Text.rich(
                            TextSpan(
                              text: 'Chưa có tài khoản? ',
                              children: [
                                TextSpan(
                                  text: 'Đăng ký',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
