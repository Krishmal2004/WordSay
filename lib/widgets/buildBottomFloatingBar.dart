import 'package:flutter/material.dart';

Widget buildBottomFloatingBar() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.mic, color: Colors.white)),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF64D2FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.auto_awesome, color: Colors.white)),
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white)),
        ],
      ),
    ),
  );
}