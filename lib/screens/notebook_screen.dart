import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:wordsy/widgets/NoteBook/buildSpiralRing.dart';

class NoteBookScreen extends StatelessWidget {
  const NoteBookScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7CCC8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFDF5E6),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: CustomPaint(
                  painter: RuledPaperPainter(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60, 40, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Works",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900],
                            fontFamily: 'Serif',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "February 21, 2026",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.67,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              hintText: "Start writting your ideas...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 50,
                bottom: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(15, (index) => buildSpiralRing()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RuledPaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.blue.withOpacity(0.15)
      ..strokeWidth = 1.0;

    final marginPaint = Paint()
      ..color = Colors.red.withOpacity(0.25)
      ..strokeWidth = 2.0;

    for (double i = 80; i < size.height; i += 30) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), linePaint);
    }
    canvas.drawLine(const Offset(50, 0), Offset(50, size.height), marginPaint);

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return false;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
