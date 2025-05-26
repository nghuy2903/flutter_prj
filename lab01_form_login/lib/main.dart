import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/backgrounds.jpg',
            fit: BoxFit.cover,
          )
        ),

        
        Scaffold(
          backgroundColor: Colors.transparent,
          //App bar
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'FITNESS LOGIN FORM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white
              ),
            ),
          ),

          //Form login
          body: Center(
            
            child: Container(
              width: size.width*0.8,
              height: size.height * 0.7,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 0.5)
              ),
              child: Column(
                
                children: [
                  //user
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'User Name ',
                              style: TextStyle(
                                color: Colors.red
                              ),
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.red,
                            )
                          ],
                        ),

                        SizedBox(height: 20,),
                        
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -5,
                              bottom: -5,
                              child: Container(
                                width: size.width * 0.6,
                                height: 25,
                                color: Colors.greenAccent,
                              ), 
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'UserName',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        )
                        
                      ],
                    )
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        )

      ],

    );
  }

}

