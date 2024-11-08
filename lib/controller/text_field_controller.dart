import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  late TextEditingController addressController = TextEditingController();

  String? checkBlank(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    }
    return null;
  }

  String? checkIsEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Không đúng dịnh dạng email';
    }
    return null;
  }

  String? checkPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
        .hasMatch(value)) {
      return 'Mật khẩu chưa đúng định dạng và tối thiểu phải 6 ký tự';
    }
    return null;
  }

  String? checkConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (value != passwordController.text) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }
}
