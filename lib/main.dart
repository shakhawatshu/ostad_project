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
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: _generateroute,
    );
  }

  MaterialPageRoute? _generateroute(RouteSettings settings){
    Widget? widget;
    //widget define here
    switch(settings.name){
      case HomeScreen.routeName:
        widget = const HomeScreen();
        break;

      case ProfileScreen.routeName:
        String username = settings.arguments as String;
        widget = ProfileScreen(userName:username);
        break;

      case SettingsScreen.routeName:
        widget= const SettingsScreen();
    }
    // widget route build here
    if(widget != null){
      return MaterialPageRoute(builder: (context)=> widget!);
    }else{
      return null;
    }

  }


}
