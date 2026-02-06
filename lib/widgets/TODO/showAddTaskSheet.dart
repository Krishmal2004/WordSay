import 'package:flutter/material.dart';
import 'package:wordsy/controller/todo_controller.dart';
import 'package:get/get.dart';

Widget showAddTaskSheet(BuildContext context, TodoController controller) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.taskController,
            decoration: const InputDecoration(
              labelText: "What needs to be done?",
            ),
            autofocus: true,
          ),
          const SizedBox(height: 20),
          Obx(
            () => ElevatedButton(
              onPressed: controller.isAdding.value
                  ? null
                  : () => controller.addTodo(),
              child: controller.isAdding.value
                  ? const CircularProgressIndicator()
                  : const Text("Add Task"),
            ),
          ),
        ],
      ),
    ),
  );
  return SizedBox.shrink();
}
