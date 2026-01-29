import 'package:flutter/material.dart';

Widget buildNoteCard ({required Color color, required Widget content, double? height}) {
  return Container(
    width: double.infinity,
    height: height,
    margin: EdgeInsets.only(bottom: 15),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: Offset(2, 2),
        ),
      ]
    ),
    child: content,
  );
}