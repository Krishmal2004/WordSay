import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';

class HelloController extends GetxController {
  var displayedText = "".obs;
  var showLogo = false.obs;
  @override
  void onInit() {
    super.onInit();
    startWelcomeSequence();
  }

  void startWelcomeSequence() async {
    // 1. Fade in logo
    await Future.delayed(const Duration(milliseconds: 500));
    showLogo.value = true;

    // 2. Type "Hello"
    await Future.delayed(const Duration(milliseconds: 500));
    await typeText("Hello");

    // 3. Pause then clear
    await Future.delayed(const Duration(milliseconds: 800));
    await backspaceText();

    // 4. Type "Wordsy"
    await Future.delayed(const Duration(milliseconds: 300));
    await typeText("Wordsy");

    // 5. Short pause then navigate
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.off(
      () => const SplashScreen(), 
      transition: Transition.fadeIn, 
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> typeText(String text) async {
    for (int i = 0; i <= text.length; i++) {
      displayedText.value = text.substring(0, i);
      
      int randomDelay = 80 + (DateTime.now().millisecond % 100); 
      if (i > 0 && text[i-1] == ' ') {
         randomDelay += 100; 
      }
      
      await Future.delayed(Duration(milliseconds: randomDelay)); 
    }
  }

  Future<void> backspaceText() async {
    int length = displayedText.value.length;
    for (int i = length; i >= 0; i--) {
      displayedText.value = displayedText.value.substring(0, i);
      await Future.delayed(const Duration(milliseconds: 30)); 
    }
  }
}
