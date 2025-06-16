import 'package:flutter/material.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});
  
  @override
  _PageRegister createState() => _PageRegister();
}

class _PageRegister extends State<PageRegister>{
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    bool checked = false;
    double widthScreen = sizeScreen.width;
    double heightScreen = sizeScreen.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //App bar
                Container(
                  width: widthScreen,
                  height: heightScreen * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue[600]
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  //Text style
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Logo
                      ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
          
                      SizedBox(height: 20,),
                      
                      Text(
                        'Tạo tài khoản mới',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),
                      ),
          
                      SizedBox(height: 10,),
          
                      Text(
                        'Gia nhập cộng đồng UTC2 ngay hôm nay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
          
                SizedBox(height: 20,),
                //Text field User
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field Email
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field Phone number
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Số điện thoại',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field Date/Year
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_month),
                      hintText: 'mm/dd/yy',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () { 
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field giới tính
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.transgender),
                      hintText: 'Chọn giới tính',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () { 
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field password
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () { 
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 8),
                // Tiêu đề
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: widthScreen*0.85,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Độ mạnh mật khẩu',
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 4),
                // Thanh ngang biểu thị độ mạnh mật khẩu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: widthScreen*0.85,
                    child: LinearProgressIndicator(
                      value: 0.0,               // Giá trị fill = 0 (chưa fill)
                      backgroundColor: Colors.grey[300],
                      color: Colors.grey[300],  // Màu thanh fill cũng xám để không thấy fill
                      minHeight: 6,
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field xác nhận mật khẩu
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Xác nhận mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () { 
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Checkbox
                SizedBox(
                  width: widthScreen*0.85,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        
                        value: checked,
                        onChanged: (bool? newValue) {
                          // Để trống, xử lý sau
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14, height: 1.5),                          children: [
                              TextSpan(text: 'Tôi đồng ý với '),
                              TextSpan(
                                text: 'Điều khoản sử dụng',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(text: ' và '),
                              TextSpan(
                                text: 'Chính sách bảo mật',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(text: ' của UTC2'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 15,),
                //button đăng ký
                SizedBox(
                  width: widthScreen*0.85,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: (){}, 
                    icon: Icon(Icons.person_add, color: Colors.white,),
                    label: Text(
                      'Đăng ký tài khoản',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
          
                SizedBox(height: 25,),
                //Line hoặc
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        color: Colors.grey.shade400,
                        indent: 45,
                        thickness: 1,
                        endIndent: 45,
                      ),
                      Container(
                        color: Colors.white, // Nền trắng đè lên divider
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Text(
                          'hoặc',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text
                Center(
                  child: Text(
                    'Đã có tài khoản?',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //button đăng nhập
                SizedBox(
                  width: widthScreen * 0.85 * 0.4, 
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                       Navigator.pushNamed(context, '/login');
                    },
                    icon: Icon(Icons.login, color: Colors.blue, size: 30,),
                    label: Text(
                      'Đăng nhập ngay',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2), // Viền màu xanh
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),            
              ]
            )
          ),
        )
      )
    );
  }
}