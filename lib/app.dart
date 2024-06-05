import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/contact_book_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildLightThemeData(),
      home: const ContactBookScreen(),
    );
  }

  ThemeData _buildLightThemeData() {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
              elevation: 15,
              padding: const EdgeInsets.only(top: 10,bottom: 10,),
        )),
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          toolbarHeight: 85,
          centerTitle: true,
          elevation: 50,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        inputDecorationTheme:  const InputDecorationTheme(
            border: OutlineInputBorder(),
            ));
  }
}
