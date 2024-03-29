import 'dart:collection';
import 'dart:core';
import 'dart:ffi';
import 'package:calculatrice/icon.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List list_icons = [
    [Color(0xFFFF9F0A), "AC"],
    [Color(0xFFFF9F0A), "D"],
    [const Color.fromARGB(165, 165, 165, 165), "%"],
    [Color(0xFFFF9F0A), "/"],
    [const Color.fromARGB(165, 165, 165, 165), "7"],
    [const Color.fromARGB(165, 165, 165, 165), "8"],
    [const Color.fromARGB(165, 165, 165, 165), "9"],
    [Color(0xFFFF9F0A), "*"],
    [const Color.fromARGB(165, 165, 165, 165), "4"],
    [const Color.fromARGB(165, 165, 165, 165), "5"],
    [const Color.fromARGB(165, 165, 165, 165), "6"],
    [Color(0xFFFF9F0A), "-"],
    [const Color.fromARGB(165, 165, 165, 165), "1"],
    [const Color.fromARGB(165, 165, 165, 165), "2"],
    [const Color.fromARGB(165, 165, 165, 165), "3"],
    [Color(0xFFFF9F0A), "+"],
    [const Color.fromARGB(165, 165, 165, 165), "0"],
    [const Color.fromARGB(165, 165, 165, 165), "."],
    [const Color.fromARGB(165, 165, 165, 165), "+/-"],
    [Color(0xFFFF9F0A), "="],
  ];
  String str = "";

  String calculation(s) {
    Parser p = Parser();
    Expression expression = p.parse(s);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 300,
              width: 500,
              alignment: Alignment.bottomRight,
              color: Colors.black,
              child: Text(
                str,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Container(
              color: Colors.black,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: list_icons.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () {
                        if (list_icons[i][1] == '=') {
                          setState(() {
                            str = calculation(str);
                          });
                        } else if (list_icons[i][1] == 'AC') {
                          setState(() {
                            str = "";
                          });
                        } else if (list_icons[i][1] == 'D') {
                          setState(() {
                            if (str.length != 0) {
                              str = str.substring(0, str.length - 1);
                            } else {
                              str = "";
                            }
                          });
                        } else if (list_icons[i][1] == "+/-") {
                          setState(() {
                            str = str + '-';
                          });
                        } else {
                          setState(() {
                            str = str + list_icons[i][1];
                          });
                        }
                      },
                      child:
                          icon(col: list_icons[i][0], text: list_icons[i][1]));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}