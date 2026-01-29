import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Wordsy',
                        style: GoogleFonts.sacramento(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.search, size: 30),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Tags/Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTag("All notes", "12", isSelected: true),
                        const SizedBox(width: 10),
                        _buildTag("Inspiration", "15"),
                        const SizedBox(width: 10),
                        _buildTag("Work", "28"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // To-Do List Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF64D2FF), // Light Blue
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To-Do List",
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Today is Friday, February 1",
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFF1F1F1F),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_outward, color: Colors.white, size: 20),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTodoItem("Music courses", isDone: true),
                        const SizedBox(height: 10),
                        _buildTodoItem("Buy Groceries", isDone: false),
                        const SizedBox(height: 10),
                        _buildTodoItem("Finish Design Project", isDone: false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Grid Layout
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Column 1
                      Expanded(
                        child: Column(
                          children: [
                             _buildNoteCard(
                               color: Colors.white,
                               content: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     height: 100,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                       color: Colors.blueAccent, // Placeholder for image
                                       gradient: const LinearGradient(
                                          colors: [Colors.blue, Colors.purple]
                                       )
                                     ),
                                     child: const Icon(Icons.image, color: Colors.white),
                                   ),
                                   const SizedBox(height: 10),
                                   const Text("Geometric poster collection", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                   const SizedBox(height: 5),
                                   const Text("Geometric poster design focuses on the...", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                 ],
                               )
                             ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Column 2
                      Expanded(
                        child: Column(
                          children: [
                            _buildNoteCard(
                              color: const Color(0xFFF5F5F5),
                              content: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.lock, size: 40, color: Colors.grey),
                                    SizedBox(height: 10),
                                    Text("Locked Note", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              height: 120,
                            ),
                            const SizedBox(height: 15),
                            _buildNoteCard(
                              color: const Color(0xFFFAFafA),
                              content: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lemon pie ingredients", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  SizedBox(height: 10),
                                  Text("• 1 cup white sugar", style: TextStyle(fontSize: 12)),
                                  Text("• 2 tablespoons all-purpose flour", style: TextStyle(fontSize: 12)),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100), // Space for floating bar
                ],
              ),
            ),
            
            // Bottom Floating Bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                     BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0,5))
                  ]
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.mic, color: Colors.white)),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(color: Color(0xFF64D2FF), shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.auto_awesome, color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String pyText, String count, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1F1F1F) : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(pyText, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Text(count, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _buildTodoItem(String text, {required bool isDone}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: 24, width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone ? const Color(0xFF00CFA5) : Colors.transparent, // Green if done
              border: Border.all(color: isDone ? Colors.transparent : Colors.black),
            ),
            child: isDone ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
          ),
          const SizedBox(width: 15),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildNoteCard({required Color color, required Widget content, double? height}) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(2,2))
        ]
      ),
      child: content,
    );
  }
}
