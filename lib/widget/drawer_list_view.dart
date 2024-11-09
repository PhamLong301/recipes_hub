import 'package:recipes_hub/controller/language_controller.dart';
import 'package:recipes_hub/controller/theme_controller.dart';
import '../view/authentication_screen/sign_up_screen.dart';
import 'log_in_widget.dart';
import 'log_out_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../view/authentication_screen/sign_in_screen.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xff70B9BE),
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(() => const SignInScreen());
            },
            child: const LoginWidget(),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          title: Text('favorites'.tr),
          onTap: () {
            alertDialog();
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('changeLanguage'.tr),
          onTap: () {
            changeLanguage();
          },
        ),
        ListTile(
          leading: Obx(() => themeController.isDarkTheme.value
              ? const Icon(Icons.light_mode, color: Colors.yellow)
              : const Icon(Icons.dark_mode, color: Colors.white)),
          title: Text('theme'.tr),
          onTap: () {
            themeController.toggleTheme();
          },
        ),
        ListTile(
          leading: const Icon(Icons.gamepad_outlined),
          title: Text('mini_game'.tr),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: Text('delete_account'.tr),
          onTap: () {
            alertDeleteAccount();
          },
        ),
        const LogoutWidget(),
      ],
    );
  }

  void alertDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('notice'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('can_not_open_favorite_list'.tr),
            Text('have_not_login_or_account'.tr),
            Text('login_or_create_account'.tr),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Hủy',
              style: TextStyle(
                color: Color(0xff70B9BE),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            child: const Text(
              'Đăng nhập ngay!',
              style: TextStyle(
                color: Color(0xff70B9BE),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const SignUpScreen());
            },
            child: const Text(
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

  void alertDeleteAccount() {
    Get.dialog(AlertDialog(
      title: Text('notice'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ask_for_delete'.tr),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'yes'.tr,
                    style: const TextStyle(
                      color: Color(0xff70B9BE),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'no'.tr,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )),
            ],
          ),
        ],
      ),
    ));
  }

  void changeLanguage() {
    final LanguageController languageController = Get.put(LanguageController());
    Get.dialog(
      AlertDialog(
        title: Text("changeLanguage".tr),
        content: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final currentLocal =
                languageController.localizations[index]['local'];
            final currentLanguage =
                languageController.localizations[index]['name'];
            return InkWell(
              onTap: () {
                Get.updateLocale(currentLocal);
                Get.back();
              },
              child: Text(currentLanguage),
            );
          },
          itemCount: languageController.localizations.length,
        ),
      ),
    );
  }
}
