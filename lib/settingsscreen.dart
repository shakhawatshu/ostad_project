import 'package:flutter/material.dart';
import 'package:ostad_project/profilescreen.dart';


class SettingsScreen extends StatelessWidget {
  static const String routeName ='/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Home')),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, ProfileScreen.routeName,arguments: {
                'name':'Shuvo',
                'email':'s.shuvo14@gmail.com',
              });
              }, child: const Text('Profile')),
          ],
        ),
      ),
    );
  }
}
