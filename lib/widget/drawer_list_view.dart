import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/main_screens/favorite_screen.dart';
import '../view/main_screens/setting_screen.dart';
import 'log_in_widget.dart';
import 'log_out_wigdet.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff70B9BE),
          ),
          child: LoginWidget(),
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.red,),
          title: Text('Favorites'),
          onTap: () {
            Get.to(FavoriteScreen());
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
            Get.back();          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Xóa tài khoản'),
          onTap: () {
            Get.back();          },
        ),
        LogoutWidget(),
      ],
    );
  }
}
