import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';

class MailHelper {
  // Hàm gửi email
  static Future<void> sendMail({
    required String toEmail,
    required String subject,
    required String content,
  }) async {
    // Thông tin SMTP, bạn cần thay đổi cho phù hợp
    String username = 'nghuy29032004@gmail.com'; // Thay bằng email của bạn
    String password = 'nkgd eswl exaq lndc'; // Thay bằng app password (không phải mật khẩu gmail thông thường)

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'UTC2 Support')
      ..recipients.add(toEmail)
      ..subject = subject
      ..text = content;

    try {
      final sendReport = await send(message, smtpServer);
      print('Gửi mail thành công: ' + sendReport.toString());
    } catch (e) {
      print('Gửi mail thất bại: $e');
      rethrow;
    }
  }

  // Hàm sinh mật khẩu mạnh
  static String generateStrongPassword({int length = 10}) {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+-=';
    Random rnd = Random.secure();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }
} 