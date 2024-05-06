import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static const String routeName ='/profile';
   const ProfileScreen({super.key, required this.profileDetails,});

   final Map<String, String> profileDetails;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(profileDetails.values.first.toString()),
            Text(profileDetails.values.last.toString()),
            ElevatedButton(onPressed: (){
            }, child: const Text('Home')),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Settings')),
          ],
        ),
      ),
    );
  }
}