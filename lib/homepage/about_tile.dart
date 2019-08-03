import 'package:flutter/material.dart';
import 'package:flutteruiapp/util/uidata.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.blue,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By Sabarish,\n",
        ),
        Text(
          "EBA Connect",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.0",
      applicationLegalese: "Copyright: EBA Connect",
    );
  }
}
