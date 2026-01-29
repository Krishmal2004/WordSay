import 'package:flutter/material.dart';
import 'package:wordsy/controller/home_controller.dart';
import 'package:wordsy/widgets/buildArrowButton.dart';
import 'package:wordsy/widgets/buildNoteCard.dart';

Widget buildNotesGrid(HomeController controller) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          children: controller.notes
              .asMap()
              .entries
              .where((entry) => entry.key % 2 == 0)
              .map((entry) {
                var note = entry.value;
                return buildNoteCard(
                  color: Colors.white,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        note['title'] ?? "Untitiled",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        note['content'] ?? "",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                );
              })
              .toList(),
        ),
      ),
      SizedBox(width: 15),
      Expanded(
        child: Column(
          children: controller.notes
              .asMap()
              .entries
              .where((entry) => entry.key % 2 != 0)
              .map((entry) {
                var note = entry.value;
                return buildNoteCard(
                  color: Color(0xFFF5F5F5),
                  content: Text(note['content'] ?? ""),
                );
              }).toList(),
        ),
      ),
    ],
  );
}
