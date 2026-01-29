import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/HelloController.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelloController());

    return Scaffold(
      backgroundColor: const Color(0xFFA020F0), // Your Wordsy Purple
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Staggered Logo Fade & Scale
            Obx(() => AnimatedScale(
              scale: controller.showLogo.value ? 1.0 : 0.8,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutQuart,
              child: AnimatedOpacity(
                opacity: controller.showLogo.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: const Icon(Icons.auto_stories, size: 80, color: Colors.white),
              ),
            )),
            
            const SizedBox(height: 30),

            // The Typing Text
            Obx(() => Text(
              controller.displayedText.value,
              textAlign: TextAlign.center,
              style: GoogleFonts.dancingScript(
                fontSize: 60, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
