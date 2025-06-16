import 'package:flutter/material.dart';
import 'package:final_test/MVC/db/user_dao.dart';
import 'package:final_test/MVC/model/user.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});
  
  @override
  _PageRegister createState() => _PageRegister();
}

class _PageRegister extends State<PageRegister> {
  // Controllers cho các trường nhập liệu
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateYearController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  // State variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;
  String _selectedGender = 'Nam';
  double _passwordStrength = 0.0;
  
  // Danh sách giới tính
  final List<String> _genders = ['Nam', 'Nữ', 'Khác'];
  
  // UserDAO để xử lý database
  final _userDAO = UserDAO();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateYearController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Hàm kiểm tra độ mạnh của mật khẩu
  void _checkPasswordStrength(String password) {
    double strength = 0.0;
    
    if (password.length >= 8) strength += 0.2;
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.2;
    if (password.contains(RegExp(r'[a-z]'))) strength += 0.2;
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.2;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.2;
    
    setState(() {
      _passwordStrength = strength;
    });
  }

  // Hàm kiểm tra định dạng email
  bool _isValidEmail(String email) {
    // Biểu thức chính quy để kiểm tra định dạng email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  // Hàm xử lý đăng ký
  Future<void> _handleRegister() async {
    // Kiểm tra dữ liệu nhập vào
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _dateYearController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Kiểm tra định dạng email
    if (!_isValidEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email không đúng định dạng'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Kiểm tra mật khẩu xác nhận
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu xác nhận không khớp'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Kiểm tra điều khoản
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng đồng ý với điều khoản sử dụng'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Kiểm tra email đã tồn tại chưa
      final existingUser = await _userDAO.getUserByEmail(_emailController.text);
      if (existingUser != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email này đã được sử dụng'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      // Tạo user mới
      final newUser = User(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text,
        dateYear: _dateYearController.text,
        gender: _selectedGender,
      );

      // Thêm vào database
      await _userDAO.insertUser(newUser);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng ký thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        // Quay về trang đăng nhập
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Có lỗi xảy ra: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
          
                      SizedBox(height: 10,),
          
                      Text(
                        'Gia nhập cộng đồng UTC2 ngay hôm nay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
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
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Họ và tên',
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
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
                    controller: _dateYearController,
                    keyboardType: TextInputType.datetime,
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
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              _dateYearController.text = '${picked.day}/${picked.month}/${picked.year}';
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field giới tính
                SizedBox(
                  width: widthScreen * 0.85,
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.transgender),
                      hintText: 'Chọn giới tính',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      }
                    },
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field password
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    onChanged: _checkPasswordStrength,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
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
                      value: _passwordStrength,
                      backgroundColor: Colors.grey[300],
                      color: _passwordStrength < 0.3
                          ? Colors.red
                          : _passwordStrength < 0.6
                              ? Colors.orange
                              : Colors.green,
                      minHeight: 6,
                    ),
                  ),
                ),
          
                SizedBox(height: 15,),
                //Text field xác nhận mật khẩu
                SizedBox(
                  width: widthScreen * 0.85,
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Xác nhận mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
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
                        value: _agreeToTerms,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreeToTerms = newValue ?? false;
                          });
                        },
                      ),
                      Expanded(
                          child: RichText(
                          text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14, height: 1.5),                          
                          children: [
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
                          )
                        )
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 20,),
                //Button đăng ký
                SizedBox(
                  width: widthScreen * 0.85,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _handleRegister,
                    icon: _isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 30,
                          ),
                    label: Text(
                      _isLoading ? 'Đang đăng ký...' : 'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 20,),
                //Button quay lại
                SizedBox(
                  width: widthScreen * 0.85,
                  height: 60,
                  child: OutlinedButton.icon(
                    onPressed: _isLoading ? null : () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.blue, size: 30,),
                    label: Text(
                      'Quay lại',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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