import 'package:flutter/material.dart';
import 'package:weather/presentation/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      home: new Home(),
    );
  }
}