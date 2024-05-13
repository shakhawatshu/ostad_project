import 'package:flutter/material.dart';
import 'package:ostad_project/button_Style.dart';
import 'package:ostad_project/simple_cart.dart';
import 'package:device_preview/device_preview.dart';

void main(){
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
