import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: const Text(' Profile ')),
            ElevatedButton(onPressed: (){}, child: const Text(' Settings ')),
          ],
        ),
      ),
    );
  }
}
