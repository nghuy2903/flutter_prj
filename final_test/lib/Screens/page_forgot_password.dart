import 'package:flutter/material.dart';
import 'package:final_test/DB/db/user_dao.dart';
import 'package:final_test/utils/mail_helper.dart';

class FogotPasswordPage extends StatefulWidget {
  const FogotPasswordPage({super.key});

  @override
  State<FogotPasswordPage> createState() => _FogotPasswordPageState();
}

class _FogotPasswordPageState extends State<FogotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final UserDAO _userDAO = UserDAO();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendMail() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final user = await _userDAO.getUserByEmail(email);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email không tồn tại trong hệ thống'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      // Sinh mật khẩu mới
      final newPassword = MailHelper.generateStrongPassword(length: 10);
      // Gửi mail
      await MailHelper.sendMail(
        toEmail: user.email,
        subject: 'Mật khẩu mới cho tài khoản UTC2',
        content: 'Mật khẩu mới của bạn là: $newPassword\nHãy đăng nhập và đổi lại mật khẩu ngay sau khi đăng nhập.',
      );
      // Cập nhật mật khẩu mới vào database
      final updatedUser = user.copyWith(password: newPassword);
      await _userDAO.updateUser(updatedUser);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã gửi mật khẩu mới về email của bạn!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Có lỗi xảy ra: ${e.toString()}'),
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
                        'Quên mật khẩu?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
          
                      SizedBox(height: 10,),
          
                      Text(
                        'Đừng lo, chúng tôi sẽ giúp bạn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                        ),
                      )
                    ],
                  ),
                ),
          
                SizedBox(height: 55,),
                //Box guidance
                Container(
                  width: widthScreen * 0.85,
                  height: 175,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Container(
                        width: 4,
                        height: 175, 
                        color: Colors.blue,
                      ),
                      SizedBox(width: 12), 
                      // Nội dung chính
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.info_outline, color: Colors.blue),
                                  SizedBox(width: 6),
                                  Text(
                                    'Hướng dẫn',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Nhập địa chỉ email đã đăng ký để nhận liên kết đặt lại mật khẩu. Kiểm tra các hộp thư rác nếu không thấy email.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 35,),
                //Textfield Email
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    controller: _emailController,
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
          
                SizedBox(height: 35,),
                //Button Gửi liên kết
                SizedBox(
                  width: widthScreen*0.85,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _handleSendMail,
                    icon: _isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Icon(Icons.send, color: Colors.white,),
                    label: Text(
                      _isLoading ? 'Đang gửi...' : 'Gửi liên kết đặt lại',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
          
                SizedBox(height: 40,),
                //Text button quay lại
                TextButton.icon(
                  onPressed: (){
                     Navigator.pushNamed(context, '/login');
                  }, 
                  label: Text('Quay lại trang đăng nhập', style: TextStyle(fontWeight: FontWeight.bold),),
                  icon: Icon(Icons.turn_left),
                ),
          
                SizedBox(height: 45,),
                //TextRich vấn đề hỗ trợ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gặp vấn đề? ',
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Chuyển đến trang hỗ trợ
                      },
                      child: Text(
                        'Liên hệ hỗ trợ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            )
          ),
        )
      )
    );
  }
}