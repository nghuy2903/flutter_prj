
import 'package:flutter/material.dart';

void main() {
  return Material();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          // title: Row(
            
          //   children: [
          //     Image.asset(
          //       'assets/images/backgrounds.jpg',
          //       height: 40,
          //     ),
          //     SizedBox(width: 10,)
          //   ],
          // ),
        ),
      ),
    );
  }
}
