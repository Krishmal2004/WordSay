import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Automates date formatting
import 'package:get/get.dart';
import 'package:wordsy/widgets/NoteBook/buildSpiralRing.dart';
import 'package:wordsy/controller/NoteBookController.dart';

class NoteBookScreen extends StatelessWidget {
  const NoteBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get current date and day automatically
    final controller = Get.put(Notebookcontroller());
    controller.fetchLatestNote();
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('MMMM d, yyyy').format(now);
    final String formattedDay = DateFormat(
      'EEEE',
    ).format(now); // e.g., "Monday"

    return Scaffold(
      backgroundColor: const Color(0xFFD7CCC8), // Wooden desk background
      body: SafeArea(
        child: TweenAnimationBuilder(
          // 2. Open Notebook Animation: Slides up and fades in smoothly
          duration: const Duration(milliseconds: 1000),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          curve: Curves.easeOutQuart,
          builder: (context, double value, child) {
            // FIX: Clamping opacity to prevent the 0.0-1.0 exception
            final double safeValue = value.clamp(0.0, 1.0);

            return Opacity(
              opacity: safeValue,
              child: Transform.translate(
                offset: Offset(0, 30 * (1.0 - safeValue)), // Subtle slide up
                child: Transform(
                  // Adds a slight 3D "open" perspective
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(0.05 * (1.0 - safeValue)),
                  alignment: Alignment.center,
                  child: child,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Stack(
              children: [
                // 3. The Paper Base
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF5E6), // Realistic cream paper
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(8, 8),
                      ),
                    ],
                  ),
                  child: CustomPaint(
                    painter:
                        RuledPaperPainter(), // Draws blue lines and red margin
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(65, 30, 25, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Works",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[900],
                                      fontFamily: 'Serif',
                                    ),
                                  ),
                                  Text(
                                    "$formattedDay, $formattedDate",
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.home_outlined,
                                  size: 32,
                                  color: Colors.brown,
                                ),
                                onPressed: () =>
                                    Get.back(), // Navigates to home
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Realistic Notepad Input
                          Expanded(
                            child: Obx(
                              () => controller.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : TextField(
                                      controller:
                                          TextEditingController(
                                              text: controller.noteText.value,
                                            )
                                            ..selection =
                                                TextSelection.collapsed(
                                                  offset: controller
                                                      .noteText
                                                      .value
                                                      .length,
                                                ),
                                      onChanged: (text) => controller.saveNote(
                                        text,
                                      ), // Real-time saving
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        height: 1.67,
                                        fontFamily: 'Serif',
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "Start writing...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 4. Spiral Binder Rings
                Positioned(
                  left: 10,
                  top: 50,
                  bottom: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(14, (index) => buildSpiralRing()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 5. Custom Painter for Ruled Paper
class RuledPaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.blue.withOpacity(0.12)
      ..strokeWidth = 1.0;

    final marginPaint = Paint()
      ..color = Colors.red.withOpacity(0.2)
      ..strokeWidth = 2.0;

    // Draw horizontal lines - starting from 135px to clear the header
    for (double i = 135; i < size.height; i += 30) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), linePaint);
    }
    // Draw the vertical red margin line
    canvas.drawLine(const Offset(55, 0), Offset(55, size.height), marginPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
