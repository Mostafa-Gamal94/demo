import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_page.dart';

void main() async {
  // init hive
  await Hive.initFlutter();

  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    theme: ThemeData(
    colorScheme: const ColorScheme.light(
    primary: Colors.yellow,    // Bright yellow as the primary color
      onPrimary: Colors.black,   // Text color for better contrast
    ),
    appBarTheme: const AppBarTheme(
    backgroundColor: Colors.yellow,   // Bright yellow for AppBar background
    foregroundColor: Colors.black,    // Text/icon color in AppBar
    )));

  }
}
