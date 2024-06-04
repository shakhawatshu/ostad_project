import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/contact_book_screen.dart';

class ContactBookApp extends StatelessWidget {
  const ContactBookApp({super.key});

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
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
              elevation: 15,
              padding: EdgeInsets.only(top: 10,bottom: 10,),
        )),
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          toolbarHeight: 85,
          centerTitle: true,
          elevation: 50,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        inputDecorationTheme:  InputDecorationTheme(
            border: OutlineInputBorder(),
            ));
  }
}
