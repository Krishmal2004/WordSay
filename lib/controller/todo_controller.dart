import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wordsy/controller/home_controller.dart';

class TodoController extends GetxController {
  final _supabase = Supabase.instance.client;
  final taskController = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var isAdding = false.obs;

  Future<void> chooseDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  Future<void> addTodo() async {
    if (taskController.text.trim().isEmpty) return;
    isAdding.value = true;
    try {
      await _supabase.from('todos').insert({
        'task_name': taskController.text.trim(),
        'is_done': false,
        'due_date': selectedDate.value.toIso8601String(),
      });
      taskController.clear();
      Get.find<HomeController>().fetchData();
      Get.back();
      Get.snackbar("Success", "Task scheduled");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isAdding.value = false;
    }
  }
}
