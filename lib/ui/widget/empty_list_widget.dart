import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'asset/lottie/empty_list.json',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Empty',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
