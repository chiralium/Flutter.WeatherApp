import 'package:flutter/material.dart';
import 'package:weather/presentation/container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Weather'),
      ),
      body: new AppContainer(),
    );
  }
}