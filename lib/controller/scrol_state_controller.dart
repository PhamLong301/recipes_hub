import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ScrollStateController extends GetxController{
  RxBool isAtTop = true.obs;
  RxBool isAtBottom = false.obs;

  void updateScrollPosition(double pixels, double maxScrollExtent) {
    isAtTop.value = pixels == 0;
    isAtBottom.value = pixels >= maxScrollExtent;
  }
}