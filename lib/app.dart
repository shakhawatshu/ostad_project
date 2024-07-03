import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/auth/splash_screen.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigatorKey,

      theme: ThemeData(
        cardTheme: const CardTheme(elevation: 5,),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: AppDesignData.whiteColor,
            filled: true,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppDesignData.defaultThemeColor),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleSmall: TextStyle(
              letterSpacing: 1,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppDesignData.defaultThemeColor,
              foregroundColor: AppDesignData.whiteColor,
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
