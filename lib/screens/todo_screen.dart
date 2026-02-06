import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsy/widgets/TODO/buildheader_todo.dart';
import 'package:wordsy/widgets/TODO/buildbottomloatingbar.dart';
import 'package:wordsy/widgets/TODO/todoTitle.dart';
import 'package:wordsy/widgets/TODO/showAddTaskSheet.dart';
import 'package:wordsy/controller/todo_controller.dart';
import 'package:wordsy/controller/home_controller.dart';


class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: buildheader_todo("title"),
      ),
      body: Obx(() => homeController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: homeController.todo.length,
              itemBuilder: (context, index) {
                final item = homeController.todo[index];
                return todoTitle(item, homeController);
              },
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1F1F1F),
        onPressed: () => showAddTaskSheet(context, todoController),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
