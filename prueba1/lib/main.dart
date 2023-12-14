import 'package:flutter/material.dart';
import 'home.dart';
//Fernando Catalan,Damian Carrillo
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), 
    );
  }
}
