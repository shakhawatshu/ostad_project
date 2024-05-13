import 'package:flutter/material.dart';

class buttonStyle{
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    shadowColor: Colors.grey,
    backgroundColor: Colors.deepOrangeAccent,
    foregroundColor: Colors.black,

  );
  static ButtonStyle iconButton = IconButton.styleFrom(
      elevation: 70,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey,
      highlightColor: Colors.white,
  );


}