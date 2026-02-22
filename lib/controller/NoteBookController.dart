import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Notebookcontroller extends GetxController {
  final supabase = Supabase.instance.client;

  var isLoading = false.obs;
  var noteText = "".obs;

  Future<void> saveNote(String text) async {
    try {
      isLoading.value = true;
      final userId = supabase.auth.currentUser?.id;
      await supabase.from('notes').upsert({
        'user_id': userId,
        'content': text,
        'updated_at': DateTime.now().toIso8601String(),
        'catergory': 'Works',
      });
      Get.snackbar(
        "Success",
        "Note saved to your journal",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLatestNote() async {
    isLoading.value = true;
    final data = await supabase
        .from('notes')
        .select()
        .eq('catergory', 'Works')
        .order('updated_at')
        .limit(1)
        .maybeSingle();

    if (data != null) {
      noteText.value = data['content'];
    }
    isLoading.value = false;
  }
}
