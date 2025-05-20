import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
        body: Align(
          // alignment: Alignment.topLeft,
          child: MyDemo(false)
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyDemo extends StatefulWidget {
  final bool loading;
  const MyDemo(
    this.loading,
    {super.key}
  );

  

  @override
  State<MyDemo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyDemo> {
  // late  bool _stateLoading;

  // @override
  // void initState() {
  //   super.initState();
  //   // TODO: implement initState
  //   _stateLoading = widget.loading;
  // }

  // void _demo(){
  //   setState(() {
  //     _stateLoading = true;
  //   });

  //   Future.delayed(Duration(seconds: 2), (){
  //     setState(() {
  //       _stateLoading = false;
  //     });
  //   });

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Error! Try it later!'),
  //       duration: Duration(seconds: 1),
  //     )
  //   );
  // }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListView(
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            children: [
              Container(
                height: 100,
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100,
                color: Colors.purple,
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100,
                color: Colors.yellow,
              )
            ],
          ),
        ),
        
      ),
    );
  }
}




