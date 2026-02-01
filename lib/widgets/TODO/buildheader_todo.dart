import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildheader_todo(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Wordsy",
        style: GoogleFonts.sacramento(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
