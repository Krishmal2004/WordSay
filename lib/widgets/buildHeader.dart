import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Wordsy',
        style: GoogleFonts.sacramento(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      Icon(
        Icons.search,
        size: 30,
      ),
    ],
  );
}
