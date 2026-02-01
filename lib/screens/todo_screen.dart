import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsy/widgets/TODO/buildheader_todo.dart';
import 'package:wordsy/widgets/TODO/buildbottomloatingbar.dart';


class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildheader_todo("title"),
      ),
    );
  }
}
