import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/authentication_controller.dart';
import 'package:recipes_hub/controller/text_field_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthenticationController authController;
  late TextFieldController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = Get.put(AuthenticationController());
    controller = Get.put(TextFieldController());
    controller.firstNameController = TextEditingController();
    controller.lastNameController = TextEditingController();
    controller.emailController = TextEditingController();
    controller.passwordController = TextEditingController();
    controller.confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                // TextFormField(
                //   cursorColor: const Color(0xff70B9BE),
                //   controller: controller.firstNameController,
                //   decoration: InputDecoration(
                //     labelText: "Tên",
                //     labelStyle: const TextStyle(
                //       color: Color(0xff70B9BE),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //       borderSide: const BorderSide(
                //         color: Color(0xff70B9BE),
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //       borderSide: const BorderSide(
                //         color: Colors.grey,
                //         width: 1.0,
                //       ),
                //     ),
                //   ),
                //   validator: controller.checkBlank,
                // ),
                const SizedBox(
                  height: 16,
                ),
                // TextFormField(
                //   cursorColor: const Color(0xff70B9BE),
                //   controller: controller.lastNameController,
                //   decoration: InputDecoration(
                //     labelText: "Họ",
                //     labelStyle: const TextStyle(
                //       color: Color(0xff70B9BE),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //       borderSide: const BorderSide(
                //         color: Color(0xff70B9BE),
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //       borderSide: const BorderSide(
                //         color: Colors.grey,
                //         width: 1.0,
                //       ),
                //     ),
                //   ),
                //   validator: controller.checkBlank,
                // ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  cursorColor: const Color(0xff70B9BE),
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
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
                    labelText: "Mật khẩu",
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
                const SizedBox(height: 16),
                TextFormField(
                  cursorColor: const Color(0xff70B9BE),
                  controller: controller.confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Xác nhận mật khẩu",
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
                  validator: controller.checkConfirmPassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      authController.register(
                          // controller.firstNameController.text.trim(),
                          // controller.lastNameController.text.trim(),
                          controller.emailController.text.trim(),
                          controller.passwordController.text.trim(),
                          // controller.confirmPasswordController.text.trim(),
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff70B9BE),
                  ),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: Colors.white,
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
