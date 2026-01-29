import 'package:flutter/material.dart';

Widget buildLoadingUI() {
  return Column(
    key: ValueKey(1),
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.auto_stories, size: 100,color: Color(0xFFD7CCC8),),
      SizedBox(height: 30,),
      Text(
        'Opening Journal...',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
      SizedBox(height: 20,),
      SizedBox(
        width: 150,
        child: LinearProgressIndicator(
          color: Colors.amber[200],
          backgroundColor: Colors.white10,
        ),
      ),
    ],
  );
}