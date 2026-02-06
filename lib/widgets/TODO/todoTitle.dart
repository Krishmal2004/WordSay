import 'package:flutter/material.dart';
import 'package:wordsy/controller/home_controller.dart';

Widget todoTitle(Map<String, dynamic> item, HomeController controller) {
  bool isDone = item['is_done'] ?? false;
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: isDone ? Colors.grey[200] : Color(0xFF64D2FF),
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      leading: Checkbox(
        value: isDone,
        activeColor: Color(0xFF00CFA5),
        onChanged: (val) => controller.toggleTodo(item['id'], isDone),
      ),
      title: Text(
        item['task_name'],
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
