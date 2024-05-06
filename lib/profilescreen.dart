import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Text(userName),
            ElevatedButton(onPressed: (){}, child: const Text(' Home ')),
            ElevatedButton(onPressed: (){}, child: const Text(' Settings ')),
          ],
        ),
      ),
    );
  }
}
