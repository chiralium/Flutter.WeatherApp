import 'package:flutter/material.dart';

class AppCountryWidget extends StatelessWidget {
  final props;
  final Function removeCountry;

  AppCountryWidget(this.props, this.removeCountry);

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