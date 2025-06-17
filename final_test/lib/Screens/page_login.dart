import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_test/DB/provider/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Kiểm tra dữ liệu nhập vào
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ email và mật khẩu'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = await userProvider.login(
        _emailController.text,
        _passwordController.text,
      );

      if (user != null) {
        // Đăng nhập thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng nhập thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        // TODO: Navigate to home page
      } else {
        // Đăng nhập thất bại
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email hoặc mật khẩu không đúng!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Có lỗi xảy ra: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    double widthScreen = sizeScreen.width;
    double heightScreen = sizeScreen.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //App bar
                Container(
                  width: widthScreen,
                  height: heightScreen * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue[600]
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  //Text style
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Logo
                      ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
          
                      SizedBox(height: 20,),
                      
                      Text(
                        'Chào mừng trở lại',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
          
                      SizedBox(height: 10,),
          
                      Text(
                        'Đăng nhập vào tài khoản của bạn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                        ),
                      )
                    ],
                  ),
                ),
          
                SizedBox(height: 20,),
          
                //Text box
                Column( 
                  children: [
                    //TextField Email
                    SizedBox(
                      width: widthScreen * 0.85,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.grey, size: 20,),
                          hintText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300)
                          ),
                          contentPadding: EdgeInsets.symmetric( vertical: 20)
                        ),
                      ),
                    ),
          
                    SizedBox(height: 20,),
                    //TextField Password
                    SizedBox(
                      width: widthScreen * 0.85,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 20),
                          hintText: 'Mật khẩu',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300)
                          ),
                          contentPadding: EdgeInsets.symmetric( vertical: 20)
                        ),
                      ),
                    ),
          
                    SizedBox(height: 20,),
                    //Button Đăng nhập
                    SizedBox(
                      width: widthScreen * 0.85,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: _isLoading ? null : _handleLogin,
                        icon: _isLoading 
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 30,
                            ),
                        label: Text(
                          _isLoading ? 'Đang đăng nhập...' : 'Đăng nhập',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,          
                          shape: RoundedRectangleBorder(         
                            borderRadius: BorderRadius.circular(10),
                          ),                         
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20,),
                    //Text Quên mật khẩu
                    TextButton.icon(
                      onPressed: _isLoading ? null : () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      icon: Icon(Icons.key, color: Colors.blue),
                      label: Text(
                        'Quên mật khẩu',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
          
                    SizedBox(height: 35,),
                    //Line 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            color: Colors.grey.shade400,
                            indent: 45,
                            thickness: 1,
                            endIndent: 45,
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Text(
                              'hoặc',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
          
                    SizedBox(height: 35,),
                    Center(
                      child: Text(
                        'Chưa có tài khoản?',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
          
                    SizedBox(height: 20,),
                    //button đăng ký
                    SizedBox(
                      width: widthScreen * 0.85 * 0.6, 
                      height: 60,
                      child: OutlinedButton.icon(
                        onPressed: _isLoading ? null : () {
                           Navigator.pushNamed(context, '/register');
                        },
                        icon: Icon(Icons.person_add, color: Colors.blue, size: 30,),
                        label: Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
          
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}