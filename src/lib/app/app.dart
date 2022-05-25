import 'package:flutter/material.dart';
import 'package:myapp/presentation/theme_manager.dart';
import 'package:myapp/test.dart';

class MyApp extends StatefulWidget {
  // Default constructor isn't used; replaced by factory.
  // const MyApp({Key? key}) : super(key: key); // default constructor

  // private named constructor
  MyApp._internal();

  int appState = 0;

  // Factory constructor for fetching the singleton instance
  factory MyApp() => instance;

  static MyApp instance = MyApp._internal(); // singleton of MyApp

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
