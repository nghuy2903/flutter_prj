import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.green, // Nền xanh lá
          child: Center(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(10), // Khoảng cách 10
              decoration: BoxDecoration(
                color: Colors.purple, // Màu tím cho container chính
                borderRadius: BorderRadius.circular(15), // Bo góc
                border: Border.all(color: Colors.red, width: 3), // Viền đỏ
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildBox("Đen", Colors.black),
                  SizedBox(height: 10), // Khoảng cách giữa các hộp
                  buildBox("Đỏ", Colors.red),
                  SizedBox(height: 10),
                  buildBox("Vàng", Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBox(String text, Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10), // Bo góc cho các hộp
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
