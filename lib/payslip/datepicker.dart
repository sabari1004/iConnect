import 'package:flutter/material.dart';
import 'dart:async';

class DatePicker extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<DatePicker> {
  String _value = '';
  DateTime month;
  final ValueChanged<DateTime> test = null;

  Future _selectDate() async {
    MonthPicker picked = await MonthPicker(
        firstDate: new DateTime(2016),
        selectedDate: new DateTime.now(),
        onChanged: test,
        lastDate: new DateTime.now());
    if (picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(
                onPressed: _selectDate,
                child: new Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
