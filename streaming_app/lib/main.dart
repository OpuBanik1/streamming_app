import 'package:flutter/material.dart';
import 'package:streaming_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.white54,
        brightness: Brightness.dark,
        // primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
