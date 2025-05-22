
import 'package:flutter/material.dart';

class Loadproduct extends StatelessWidget {
  const Loadproduct({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                width: size.width * 0.9,
                height: size.height * 0.6,
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
                //Hiển thị sản phẩm
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
      leading: Icon(Icons.shopping_bag),
      title: Text('Sản phẩm A'),
      subtitle: Text('Giá: 100.000đ'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),

    // Sản phẩm 2
    ListTile(
      leading: Icon(Icons.shopping_bag),
      title: Text('Sản phẩm B'),
      subtitle: Text('Giá: 200.000đ'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}