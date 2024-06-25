import 'package:flutter/material.dart';
import 'package:ostad_project/ui/controllers/auth_controllers.dart';
import 'package:ostad_project/ui/screens/auth/sign_in_screen.dart';
import 'package:ostad_project/ui/screens/update_profile_screen.dart';
import 'package:ostad_project/ui/widget/network_cached_image.dart';
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
        child: const CircleAvatar(
          child: NetworkCachedImage(url: ''),
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AuthControllers.userData?.fullName ?? '',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          AuthControllers.userData?.email ?? '',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: ()async{
          await AuthControllers.clearAllData();
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
