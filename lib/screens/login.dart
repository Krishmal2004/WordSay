import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsy/controller/profile_controller.dart';
import '../controller/loadingController.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: const Color(0xFF5D4037),
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Color(0xFF5D4037),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.ageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Age",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => DropdownButton<String>(
                value: controller.selectGender.value,
                dropdownColor: Color(0xFF5D4037),
                items: <String>['Male', 'Female', 'Not Refer'].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (newValue) => controller.selectGender.value = newValue!,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.addressController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.educationController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Education",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            TextField(
              controller: controller.bioController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Bio",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 40),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.createProfile,
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Text("Save to Date"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
