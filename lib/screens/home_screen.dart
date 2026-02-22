import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'package:wordsy/widgets/buildHeader.dart';
import 'package:wordsy/widgets/buildTags.dart';
import 'package:wordsy/widgets/buildTodoCart.dart';
import 'package:wordsy/widgets/buildNotesGrid.dart';
import 'package:wordsy/widgets/buildBottomFloatingBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Color(0xFFD7CCC8),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => controller.fetchData(),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            buildHeader(),
                            SizedBox(height: 20),
                            buildTages(),
                            SizedBox(height: 25),
                            buildTodoCart(controller),
                            SizedBox(height: 25),
                            buildNotesGrid(controller),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
            ),
            buildBottomFloatingBar(),
          ],
        ),
      ),
    );
  }
}
