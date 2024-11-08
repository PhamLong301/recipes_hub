import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              backgroundColor: Color(0xfff5f7fa), // Light gray background color
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
                  Icon(
                    Icons.exit_to_app,
                    color: Color(0xff70B9BE), // Icon color matching text
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Đăng xuất',
                    style: TextStyle(
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
    Get.dialog(
      AlertDialog(
        title: Text('Thông báo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bạn chắc chắc muốn đăng xuất!'),
            Row(
              children: [
                TextButton(onPressed: () {}, child: Text('Có',
                  style: TextStyle(
                    color: Color(0xff70B9BE),
                  ),)),
                TextButton(onPressed: () {
                  Get.back();
                }, child: Text('Không',
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
