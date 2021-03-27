import 'package:flutter/material.dart';
import 'package:weather/config/config.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AppInputFields extends StatefulWidget {
  final Function addCountry;

  AppInputFields(this.addCountry);

  @override
  createState() {
    return new AppInputFieldsState(this.addCountry);
  }
}

class AppInputFieldsState extends State<AppInputFields> {
  bool countryNotFound = false;
  var countryProps;

  final Function addCountry;
  AppInputFieldsState(this.addCountry);
  
  fetchCountries(String term) async {
    String apiMethod = "/rest/v2/name/";
    if (term.length == 0) {
      setState(() {
        countryNotFound = false;
      });
      return null;
    }

    print("Start Request to: ${apiMethod + term}");
    var response = await http.get(
        Uri.https(countryUrl, apiMethod + term, {'q': '{https}'}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)[0];
      setState(() {
        countryNotFound = false;
        countryProps = {
          "name": data['name'],
          "code": data['alpha3Code'],
        };
      });
    } else {
      setState(() {
        countryNotFound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width: 200,
              child: new TextFormField(onChanged: this.fetchCountries),
            ),
            new IconButton(
              icon: new Icon(Icons.done),
              onPressed: () {
                if (this.countryProps != null) this.addCountry(this.countryProps);
              },
            ),
          ],
        ),
        new Visibility(
          child: new Text("Country Not Found!"),
          visible: this.countryNotFound,
        )
      ],
    );
  }
}