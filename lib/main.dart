import 'package:flutter/material.dart';
import 'package:registring_items_2/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.cyan,
          toolbarHeight: 80,
          titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: const HomePage(),
    );
  }
}
