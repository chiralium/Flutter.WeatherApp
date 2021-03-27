import 'package:flutter/material.dart';
import 'package:weather/presentation/components/AppInputField.dart';
import 'package:weather/presentation/components/AppCountryWidget.dart';

class AppContainer extends StatefulWidget {
  @override
  createState() {
    return new AppContainerState();
  }
}

class AppContainerState extends State<AppContainer> {
  List countries = [];

  void addCountry(props) {
    setState(() {
      if (countries.indexWhere((element) => element['name'] == props['name']) < 0) {
        countries.add(props);
      }
    });
  }

  void removeCountry(props) {
    setState(() {
      countries.removeWhere((element) => element['name'] == props['name']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return (
      new Column(
        children: [
          new Expanded(
            flex: 10,
            child: Center(
              child: new ListView.separated(
                padding: const EdgeInsets.all(20.0),
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    key: ObjectKey(countries[index]),
                    child: new AppCountryWidget(countries[index], removeCountry),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            )
          ),
          new Expanded(
            flex: 2,
            child: new AppInputFields(addCountry),
          )
        ],
      )
    );
  }
}