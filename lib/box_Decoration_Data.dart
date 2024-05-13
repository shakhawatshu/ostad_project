import 'package:flutter/material.dart';

class DecorationData{
  static BoxDecoration boxDecoration= BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        offset: Offset(1, 3),
        blurRadius: 3,
      ),
    ],
  );
}