import 'package:flutter/material.dart';
import 'package:ostad_project/homescreen.dart';
import 'package:ostad_project/profilescreen.dart';
import 'package:ostad_project/settingsscreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: _generateRoute );
        }

        MaterialPageRoute? _generateRoute (RouteSettings settings){
          Widget? widget;
          if(settings.name == ProfileScreen.routeName){
            Map<String, String> profileDetails= settings.arguments as Map<String, String>;
            widget = ProfileScreen(profileDetails: profileDetails);
          }else if(settings.name == SettingsScreen.routeName){
            widget = const SettingsScreen();
          }else if(settings.name == HomeScreen.routeName){
            widget = const HomeScreen();
          }
          if(widget !=  null){
            return MaterialPageRoute(builder: (context) => widget!);
          }else{
            return null;
          }
        }
}






