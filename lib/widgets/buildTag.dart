import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTag(String pyText, String count, {bool isSelected = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
    decoration: BoxDecoration(
      color: isSelected ? Color(0xFF1F1F1F) : Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Text(
        pyText,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: Text(
            count,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
