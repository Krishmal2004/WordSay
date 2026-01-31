import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:wordsy/screens/todo_screen.dart';

Widget buildArrowButton() {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Color(0xFF1F1F1F),
      shape: BoxShape.circle,    
    ),
    /*child: Icon(
      Icons.arrow_outward,
      color: Colors.white,
      size: 20,
    ),updated button*/
    child: IconButton(
      onPressed: () =>Get.toNamed('/todo'),
      icon: Icon(
        Icons.arrow_outward,
        color: Colors.white,
        size: 20,
      ),
      constraints: BoxConstraints(),
      padding: const EdgeInsets.all(10),
    ),
  );

}