import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ostad_project/ui/controllers/auth_controllers.dart';
import 'package:ostad_project/ui/screens/auth/sign_in_screen.dart';
import 'package:ostad_project/ui/screens/update_profile_screen.dart';
import 'package:ostad_project/utility/app_design_data.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]) {
  return AppBar(
    toolbarHeight: 80,
    backgroundColor: AppDesignData.defaultThemeColor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 11),
      child: GestureDetector(
        onTap: () {
          if (fromUpdateProfile) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpdateProfileScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.memory(base64Decode(AuthControllers.userData?.photo ?? ''),
              ),
            ),
          ),
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AuthControllers.userData?.fullName ?? '',
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        Text(
          AuthControllers.userData?.email ?? '',
          style: const TextStyle(fontSize: 13, color: Colors.white),
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () async {
          await AuthControllers.clearUserData();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false,
          );
        },
        icon: const Icon(Icons.logout),
      )
    ],
  );
}
