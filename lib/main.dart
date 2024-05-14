import 'package:flutter/material.dart';
import 'package:ostad_project/product_List_Screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            fixedSize: const Size.fromWidth(double.maxFinite),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
            foregroundColor: Colors.black,

          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.red)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
      ),
      debugShowCheckedModeBanner: false,
      home:  const productListScreen(
      ),
    );
  }
}


