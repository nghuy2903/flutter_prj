
import 'package:flutter/material.dart';

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
        body: MyDemo()
      ),
    ),
  ));
}

class MyDemo extends StatelessWidget{
  const MyDemo({super.key});

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
                      margin: EdgeInsets.all(16), // tạo khoảng cách so với mép
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.grey),
                      ),
                      //Icon trong ô
                      child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),
                        )
                    ),

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
