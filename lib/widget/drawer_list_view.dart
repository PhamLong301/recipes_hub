import '../view/authentication_screen/sign_up_screen.dart';
import 'log_in_widget.dart';
import 'log_out_wigdet.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../view/main_screens/favorite_screen.dart';
import '../view/authentication_screen/sign_in_screen.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff70B9BE),
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(() => SignInScreen());
            },
            child: LoginWidget(),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          title: Text('Favorites'),
          onTap: () {
            alertDialog();
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Ngôn ngữ'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text('Theme'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: Icon(Icons.gamepad_outlined),
          title: Text('Mini game'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Xóa tài khoản'),
          onTap: () {
            alertDeleteAccount();
          },
        ),
        LogoutWidget(),
      ],
    );
  }

  void alertDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Thông báo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Không thể mở danh sách yêu thích!'),
            Text('Bạn chưa đăng nhặp hoặc chưa có tài khoản!'),
            Text(
                'Hãy đăng nhập hoặc tạo tài khoản để lưu lại công thức yêu thích!'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Hủy',
              style: TextStyle(
                color: Color(0xff70B9BE),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => SignInScreen());
            },
            child: Text(
              'Đăng nhập ngay!',
              style: TextStyle(
                color: Color(0xff70B9BE),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => SignUpScreen());
            },
            child: Text(
              'Tạo tài khoản!',
              style: TextStyle(
                color: Color(0xff70B9BE),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void alertDeleteAccount(){
    Get.dialog(
        AlertDialog(
          title: Text('Thông báo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bạn chắc chắc muốn xóa tài khoản!'),
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
