import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/text_field_controller.dart';
import 'package:recipes_hub/view/authentication_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextFieldController controller = Get.put(TextFieldController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: const Color(0xff70B9BE),
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color(0xff70B9BE),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0xff70B9BE),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: controller.checkIsEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  cursorColor: const Color(0xff70B9BE),
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color(0xff70B9BE),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0xff70B9BE),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: controller.checkPassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff70B9BE),
                  ),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Chưa có tài khoản? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        "Đăng ký ngay",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
