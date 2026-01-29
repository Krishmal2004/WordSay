import "package:flutter/material.dart";

Widget buildArrowButton() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Color(0xFF1F1F1F),
      shape: BoxShape.circle,    
    ),
    child: Icon(
      Icons.arrow_outward,
      color: Colors.white,
      size: 20,
    ),
  );

}