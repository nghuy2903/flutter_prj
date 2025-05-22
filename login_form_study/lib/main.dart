
import 'package:flutter/material.dart';
import 'package:login_form_study/loadProduct.dart';

void main() {
  return runApp(MaterialApp(
    //SafeArea Đưa data vào trong giao diện chính
    home: SafeArea(
      //Scaffold đại diện cho toàn bộ màn hình
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Tu hoc flutter"),
        //   backgroundColor: Colors.red,
        // ),
        // body: const Center(
        //   child: Text("HelloWorld!")
        // )
        body: Loadproduct()
      ),
    ),
  ));
}

class MyDemo extends StatelessWidget{
  final emailController = TextEditingController();
  final passController = TextEditingController();

  MyDemo({super.key});
  
  
  void checkUser(BuildContext context){
    String email =  emailController.text.trim();
    String pass = passController.text;

    if(email == 'test@gmail.com' && pass == '123'){
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loadproduct())
      );
    }else{
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Đăng nhập thất bại"),
          content: Text("Sai email hoặc mật khẩu."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgrounds.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          Align(
            alignment: Alignment.center ,
            child: SizedBox(
              height: size.height * 0.68,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    
                    child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),

          Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              heightFactor: 0.5,
              //Khung đăng ký
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white
                  ), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(2, 2)
                    )
                  ],
                  borderRadius: BorderRadius.circular(5.0)
                ),
                //Khung con chứa các ô email, password
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Khung chứa email
                    // Ô con ở phía trên
                    Container(
                      margin: EdgeInsets.all(16), // tạo khoảng cách so với mép
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      //Icon trong ô
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email đăng ký',
                          hintStyle: TextStyle(
                            fontSize: 20
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ), 
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    //Khung chứa password
                    Container(
                      margin: EdgeInsets.fromLTRB(16,4,16,4), // tạo khoảng cách
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      //Icon trong ô
                      child: TextField(
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          hintStyle: TextStyle(
                            fontSize: 20
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ), 
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    //Text quên mật khẩu
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          )),
                      )
                    ),
                    
                    //Ô đăng nhập
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 25, 16, 15),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          //Xử lý nút nhấn
                          checkUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                        ), 
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                          ),
                        ),
                      ),
                      
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(5, 25, 10, 10),
                      child: Row(
                        children: [
                          Expanded(
                            //Nút google
                            child: ElevatedButton(
                              onPressed: (){
                                //Xử lý logic 
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[ 
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/gg_logo.jpg',
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                ]
                              )
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            //Nút facebook
                            child: ElevatedButton(
                              onPressed: (){
                                //Xử lý logic 
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/fb_logo.jpg',
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Text(
                                    'FaceBook',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                    ),

                    //Text cuối
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Chưa có tài khoản? ',
                          children: [
                            TextSpan(
                              text: 'Đăng ký',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ]
                        ),
                      ),
                    )
                  ],
                ),               
              ),
              
            ),
          ),
        ],
      ),
    );
  }

  

}
