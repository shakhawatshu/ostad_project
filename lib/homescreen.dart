import 'package:flutter/material.dart';
import 'package:ostad_project/profilescreen.dart';
import 'package:ostad_project/settingsscreen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, ProfileScreen.routeName,arguments: 'Shuvo');
            }, child: const Text(' Profile ')),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, SettingsScreen.routeName);
            }, child: const Text(' Settings ')),
          ],
        ),
      ),
    );
  }
}
