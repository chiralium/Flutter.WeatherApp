import 'package:flutter/material.dart';
import 'package:weather/presentation/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      home: new Home(),
    );
  }
}