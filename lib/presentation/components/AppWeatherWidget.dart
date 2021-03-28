import 'package:flutter/material.dart';

class AppWeatherWidget extends StatelessWidget {
  final props;

  AppWeatherWidget(this.props);

  @override
  Widget build(BuildContext context) {
    return (
      new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Text("temp:", style: TextStyle(fontSize: 12.0)),
                new Text("wind:", style: TextStyle(fontSize: 12.0)),
                new Text("hum.:", style: TextStyle(fontSize: 12.0)),
                new Text("time:", style: TextStyle(fontSize: 12.0)),
              ],
            ),
            new Column(
              children: [
                new Text(this.props['current']['temperature'].toString(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
                new Text(this.props['current']['wind_speed'].toString(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
                new Text(this.props['current']['humidity'].toString(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
                new Text(this.props['location']['localtime'].split(" ")[1], style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      )
    );
  }
}