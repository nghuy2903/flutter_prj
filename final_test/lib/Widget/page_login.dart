import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      'Chào mừng trở lại',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),

                    SizedBox(height: 10,),

                    Text(
                      'Đăng nhập vào tài khoản của bạn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
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
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  //TextField Password
                  SizedBox(
                    width: widthScreen * 0.85,
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Mật khẩu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  //Button Đăng nhập
                  SizedBox(
                    width: widthScreen * 0.85,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //backend
                      },
                      icon: Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(
                        'Đăng nhập',
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
                    onPressed: (
                    ) {
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
                          color: Colors.white, // Nền trắng đè lên divider
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
                      onPressed: () {
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
                        side: BorderSide(color: Colors.blue, width: 2), // Viền màu xanh
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
      )
    );
  }
}