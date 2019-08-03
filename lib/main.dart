import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutteruiapp/myapp.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
