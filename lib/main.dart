import 'package:flutter/material.dart';
import 'package:ostad_project/home_screen.dart';

void main(){
  runApp(const waterTrackerApp());
}

class waterTrackerApp extends StatelessWidget {
  const waterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
