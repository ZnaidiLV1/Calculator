import 'dart:ffi';

import 'package:flutter/material.dart';

class icon extends StatefulWidget {
  Color col;
  String text;
  icon({super.key, required this.col, required this.text});

  @override
  State<icon> createState() => _iconState(col: col, text: text);
}

class _iconState extends State<icon> {
  Color col;
  String text;
  _iconState({required this.col, required this.text});
  // Void print_str(){
  //   retu
  // }
  
  @override
  Widget build(BuildContext context) {
    return 
        
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: col, borderRadius: BorderRadius.circular(60)),
            height: 85,
            width: 85,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 29),
              ),
            ),
          ),
        );
  }
}
