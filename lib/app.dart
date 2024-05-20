import 'package:flutter/material.dart';
import 'package:ostad_project/add_Product_Screen.dart';
import 'package:ostad_project/product_List_Screen.dart';
import 'package:ostad_project/update_Product_Screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: productListScreen(),
      // initialRoute: '/',
      // onGenerateRoute: _routeGenerate,
      themeMode: ThemeMode.system,
      theme:_buildThemeData(),
      darkTheme:_buildDarkThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildDarkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            fixedSize: const Size.fromWidth(double.maxFinite),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
            foregroundColor: Colors.black,
            backgroundColor: Colors.lime

          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.red)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
    );


  }

  ThemeData _buildThemeData() {
    return ThemeData(
      brightness:Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            fixedSize: const Size.fromWidth(double.maxFinite),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
            foregroundColor: Colors.black,

          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.red)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
    );
  }

  //make materialpageroute nullble
/*
  MaterialPageRoute? _routeGenerate(RouteSettings settings){
    Widget? widget;
    switch (settings.name){
      case productListScreen.routeName:
        widget = const productListScreen();
        break;
      case AddProductScreen.routeName:
        widget = const AddProductScreen();
        break;
      case UpdateProductScreen.routeName:
        List<Product> args = settings.arguments as List<Product>;
        widget = UpdateProductScreen(product: args,);
        break;
    }
    if(widget != null){
      return MaterialPageRoute(builder: (context) =>  widget!,);
    }
    return null;

  }
*/
}