import 'package:final_test/MVC/db/user_dao.dart';
import 'package:final_test/MVC/model/user.dart';

class InitData {
  final UserDAO _userDAO = UserDAO();

  // Hàm khởi tạo dữ liệu mẫu
  Future<void> initSampleData() async {
    // Kiểm tra xem đã có dữ liệu chưa
    final users = await _userDAO.getAllUsers();
    if (users.isEmpty) {
      // Tạo user mẫu
      final sampleUser = User(
        email: 'admin@gmail.com',
        password: '123456',
        name: 'Nguyễn Văn A',
        phone: '0123456789',
        dateYear: '1990',
        gender: 'Nam',
      );

      // Thêm vào database
      await _userDAO.insertUser(sampleUser);
      print('Đã thêm dữ liệu mẫu thành công!');
    } else {
      print('Đã có dữ liệu trong database!');
    }
  }
} 