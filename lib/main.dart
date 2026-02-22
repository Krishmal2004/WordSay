import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'screens/login.dart';
//import 'screens/loadingScreen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/index.dart';
import 'screens/todo_screen.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://thguqexyqvifczfxesqs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoZ3VxZXh5cXZpZmN6Znhlc3FzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2MTkyODUsImV4cCI6MjA4NTE5NTI4NX0.VkAJ3tMNBC6U3mR_-CJQUakjlVNRf9yb4mrP-WDkSLw',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wordsy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA020F0)),
        useMaterial3: true,
      ),
      home: IndexScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => IndexScreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/todo', page: () => TodoScreen()),
      ],
    );
  }
}
