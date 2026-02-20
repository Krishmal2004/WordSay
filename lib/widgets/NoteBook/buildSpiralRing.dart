import 'package:flutter/material.dart';

Widget buildSpiralRing() {
  return Container(
    height: 12,
    width: 30,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.grey[700]!,
          Colors.grey[300]!,
          Colors.grey[800]!,
        ],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
