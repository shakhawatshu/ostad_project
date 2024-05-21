import 'package:flutter/material.dart';
import 'package:ostad_project/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 50,
          )),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
