import 'package:flutter/material.dart';
class Data{
  String image;
  String text;

  Data({required this.image, required this.text}
      );
}
class textStyle{
  static TextStyle style = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );


}

class boxDecoration{
  static BoxDecoration style = BoxDecoration(
    image: DecorationImage(
        image: NetworkImage(''),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(30),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(5, 12),
      ),
    ],

  );
}



