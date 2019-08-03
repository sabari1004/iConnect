import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutteruiapp/homepage/home_page.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
//import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

class ViewPayslip extends StatefulWidget {
  final String empID;

  ViewPayslip({Key key, this.empID}) : super(key: key);

  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ViewPayslip> {
  final DateFormat dateFormat = new DateFormat('MMMM yyyy');
  DateTime selectedMonth;

  @override
  void initState() {
    super.initState();
    selectedMonth = new DateTime(2017, 6);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('PDF View'),
        ),
        body: new Center(
          child: RaisedButton(
            onPressed: () => FlutterPdfViewer.loadAsset('assets/Test.pdf'), //
            child: Text('OPEN'),
          ),
        ),
      ),
    );
  }
}
