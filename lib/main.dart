import 'package:flutter/material.dart';
// import 'pages/products.dart';
import 'pages/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        brightness: Brightness.light
      ),
      home: AuthPage()
    );
  }
}

