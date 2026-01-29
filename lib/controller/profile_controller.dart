import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final educationController = TextEditingController();
  final addressController = TextEditingController();

  SupabaseClient get _supabase => Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  var isLoading = false.obs;
  var selectedImagePath = ''.obs;
  var selectGender = 'Male'.obs;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  Future<void> createProfile() async {
    if (nameController.text.trim().isEmpty || emailController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your name and email");
      return;
    }
    isLoading.value = true;
    try {
      String? imageUrl;
      if (selectedImagePath.value.isNotEmpty) {
        final file = File(selectedImagePath.value);
        final fileName = 'public/${DateTime.now().millisecondsSinceEpoch}.png';

        await _supabase.storage.from('avatars').upload(fileName, file);
        imageUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);
      }
      await _supabase.from('profiles').insert({
        'username': nameController.text.trim(),
        'bio': bioController.text.trim(),
        'avatar_url': imageUrl,
        'age': ageController.text.trim(),
        'email': emailController.text.trim(),
        'education': educationController.text.trim(),
        'address': addressController.text.trim(),
        'created_at': DateTime.now().toIso8601String(),
      });
      Get.snackbar("Success", "Profile and Image Saved Successfully");
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
