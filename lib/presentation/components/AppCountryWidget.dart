import 'package:flutter/material.dart';
import 'package:weather/config/config.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AppCountryWidget extends StatefulWidget {
  final props;
  final Function removeCountry;

  AppCountryWidget(this.props, this.removeCountry);

  @override
  createState() {
    return new AppCountryWidgetState(this.props, this.removeCountry);
  }
}

class AppCountryWidgetState extends State<AppCountryWidget> {
  final props;
  final Function removeCountry;

  AppCountryWidgetState(this.props, this.removeCountry);

  void fetchWeather() async {
    String apiMethod = "/current";
    print("Start Request to: $apiMethod");
    if (this.props != null) {
      var response = await http.get(
        Uri.http(weatherUrl, apiMethod, {"access_key": weatherApiKey, "query": this.props['name']})
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (
        new Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: [
                  new Text(this.props['name']),
                  new Text(this.props['code'], style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              new Column(
                children: [
                  new Text("Weather Widget"),
                ],
              ),
              new Column(
                children: [new IconButton(icon: new Icon(Icons.autorenew), onPressed: (){})],
              ),
              new Column(
                children: [
                  new IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: (){
                        this.removeCountry(this.props);
                      }
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}