import 'dart:ui';
import 'package:get/get.dart';

class LanguageController extends GetxController{
  final List<Map<String, dynamic>> localizations = [
    {
      "name" : "english".tr,
      "local" : const Locale('en', 'US')
    },
    {
      "name" : "vietnamese".tr,
      "local" : const Locale('vi', 'VN')
    },
  ];
}