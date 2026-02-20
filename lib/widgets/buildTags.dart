import 'package:flutter/material.dart';
import 'package:wordsy/widgets/buildTag.dart';
import 'package:get/get.dart';
import '../screens/notebook_screen.dart';

Widget buildTages() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        buildTag("All notes", "12", isSelected: true),
        SizedBox(width: 10),
        buildTag("Inspiration", "5"),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.to(() => const NoteBookScreen());
          },
          child: buildTag("Works", "28"),
        ),
        SizedBox(width: 10),
        buildTag("Ideas", "7"),
      ],
    ),
  );
}
