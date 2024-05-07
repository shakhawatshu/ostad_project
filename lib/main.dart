import 'package:flutter/material.dart';
import 'package:ostad_project/home_screen.dart';
import 'package:device_preview/device_preview.dart';
void main(){
  runApp(
      DevicePreview(
          enabled: true,
          builder: (context) => const CalculatorApp()));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          elevation: 70,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

        ),

      ),

      home: const HomeScreen(),
    );
  }
}
