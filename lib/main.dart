import 'package:flutter/material.dart';
import 'package:marksheeet/view.dart';


import 'result.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => StudentEntryScreen(),
      '/view': (context) => ResultPage(),
    },
  ));
}
