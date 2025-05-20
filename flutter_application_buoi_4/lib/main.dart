import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool staySignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgroud.jpg'), // Add your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FITNESS LOGIN FORM',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withAlpha(100),
                        spreadRadius: 1,
                        offset: Offset(-5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            'Username',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.person, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(56, 228, 145, 1),
                              spreadRadius: 0, // Giảm spreadRadius để giống hình ảnh
                              offset: Offset(-5, 5), // Điều chỉnh offset để shadow nằm gần hơn
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            'Password',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.lock_open_outlined, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(56, 228, 145, 1),
                              spreadRadius: 0, // Giảm spreadRadius để giống hình ảnh
                              offset: Offset(-5, 5), // Điều chỉnh offset để shadow nằm gần hơn
                            ),
                          ],
                        ),
                        child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ),
                      
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            value: staySignedIn,
                            onChanged: (value) {
                              setState(() {
                                staySignedIn = value;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text(
                            'Stay Signed In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
