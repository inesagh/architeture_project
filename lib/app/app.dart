import 'package:architeture_project/presentation/resources/routes_manager.dart';
import 'package:architeture_project/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); //default

  MyApp._internal(); //private named constr.

  int appState = 0;

  static final MyApp instance =
      MyApp._internal(); //single instance -> singleton

  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
