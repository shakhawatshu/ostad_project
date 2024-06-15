import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/network_cached_image.dart';
import 'package:ostad_project/utility/app_design_data.dart';

AppBar profileAppBar() {
  return AppBar(
    toolbarHeight: 80,
    backgroundColor: AppDesignData.defaultThemeColor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 11),
      child: CircleAvatar(
        child: NetworkCachedImage(url: ''),
      ),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          'email@email.com',
          style: TextStyle(fontSize: 16, color: Colors.white),
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.logout),
      )
    ],
  );
}