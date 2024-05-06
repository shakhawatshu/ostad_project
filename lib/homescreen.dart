import 'package:flutter/material.dart';
import 'package:ostad_project/profilescreen.dart';
import 'package:ostad_project/settingsscreen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName ='/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                child: const Text('Settings')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName, arguments: {
                    'Name':'Shuvo',
                    'Email': 'Shakhawatshuvo1@gmail.com',
                  });
                },
                child: const Text('Profile')),
          ],
        ),
      ),
    );
  }
}
