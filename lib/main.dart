import 'package:flutter/material.dart';
import 'package:top_git_rep/main_screen.dart';
import 'package:top_git_rep/models/app_di.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
