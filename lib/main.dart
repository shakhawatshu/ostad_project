import 'package:flutter/material.dart';
import 'package:ostad_project/button_Style.dart';
import 'package:ostad_project/simple_cart.dart';

void main(){
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: buttonStyle.elevatedButton,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 90,
        )
      ),
      home: const Cart(),
    );
  }
}
