import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/todo_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreen(),
    );
  }
}
