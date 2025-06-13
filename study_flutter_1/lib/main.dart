import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Home()
    ),
  );
}

class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
      
      child: Container(
        color: Colors.green,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.purple
            ),
            width: sizeScreen.width * 0.7,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.black,
                  width: sizeScreen.width * 0.7 * 0.9,
                  height: 100,
                ),
                Container(
                  color: Colors.red,
                  width: sizeScreen.width * 0.7 * 0.9,
                  height: 100,
                ),
                Container(
                  color: Colors.yellow,
                  width: sizeScreen.width * 0.7 * 0.9,
                  height: 100,
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}
