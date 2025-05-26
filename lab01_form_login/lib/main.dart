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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Column(
                
                children: [
                  //user
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
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

                        SizedBox(height: 8,),

                        TextField(
                          
                          decoration: InputDecoration(
                            labelText: 'UserName',
                            border: OutlineInputBorder(),
                          ),
                          
                        ),
                        
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

