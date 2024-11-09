import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/authentication_controller.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 180,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff5f7fa), // Light gray background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // Rounded corners
              ),
              elevation: 1, // Light shadow for subtle depth
            ),
            child: GestureDetector(
              onTap: () {
                logoutAlertDialog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.exit_to_app,
                    color: Color(0xff70B9BE), // Icon color matching text
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'sign_out'.tr,
                    style: const TextStyle(
                      color: Color(0xff70B9BE),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  void logoutAlertDialog(){
    final AuthenticationController authController = Get.put(AuthenticationController());
    Get.dialog(
      AlertDialog(
        title: const Text('Thông báo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bạn chắc chắc muốn đăng xuất!'),
            Row(
              children: [
                TextButton(onPressed: () {
                  authController.signOut();
                }, child: const Text('Có',
                  style: TextStyle(
                    color: Color(0xff70B9BE),
                  ),)),
                TextButton(onPressed: () {
                  Get.back();
                }, child: const Text('Không',
                style: TextStyle(
                  color: Colors.grey,
                ),)),
              ],
            ),
          ],
        ),
      )
    );
  }
}
