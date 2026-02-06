import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordsy/controller/home_controller.dart';
import 'package:wordsy/widgets/TODO/todoTitle.dart';
import 'package:wordsy/widgets/buildArrowButton.dart';
import 'package:get/get.dart';

Widget buildTodoCart(HomeController controller) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Color(0xFF64D2FF),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To-Do List",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Today is Friday, February 1",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            buildArrowButton(),
          ],
        ),
        //SizedBox(height: 20),
        Obx(
          () => Column(
            children: controller.todo.map((item) {
              return todoTitle(item, controller);
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
