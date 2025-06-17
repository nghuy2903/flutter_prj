import 'package:final_test/DB/provider/user_provider.dart';
import 'package:final_test/DB/model/user.dart';

class InitData {
  final UserProvider _userProvider;

  InitData(this._userProvider);

  // Hàm khởi tạo dữ liệu mẫu
  Future<void> initSampleData() async {
    // Kiểm tra xem đã có dữ liệu chưa
    final users = await _userProvider.getAllUsers();
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
      await _userProvider.insertUser(sampleUser);
      print('Đã thêm dữ liệu mẫu thành công!');
    } else {
      print('Đã có dữ liệu trong database!');
    }
  }
} 