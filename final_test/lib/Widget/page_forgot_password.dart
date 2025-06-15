import 'package:flutter/material.dart';

class FogotPasswordPage extends StatelessWidget {
  const FogotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    double widthScreen = sizeScreen.width;
    double heightScreen = sizeScreen.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),

                    SizedBox(height: 10,),

                    Text(
                      'Đừng lo, chúng tôi sẽ giúp bạn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 55,),
              //Box guidance
              Container(
                width: widthScreen * 0.85,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Container(
                      width: 4,
                      height: 100, 
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
                                    fontSize: 16,
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
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade100),
                  ),
                ),
              ),
            ]
          )
        )
      )
    );


  }
}