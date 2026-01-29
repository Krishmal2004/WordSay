import 'dart:async';
import 'package:get/get.dart';

class Loadingcontroller extends GetxController {
  void onGetStarted() {
    Get.offAllNamed('/login');
  }
}
