import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutteruiapp/login/login.dart';
import 'package:flutteruiapp/homepage/homescreen.dart';
import 'package:flutteruiapp/homepage/home_page.dart';
import 'package:flutteruiapp/login/loginobject.dart';
import 'package:flutteruiapp/util/uidata.dart';
import 'package:flutteruiapp/payslip/viewpayslip.dart';
import 'package:flutteruiapp/payslip/selectmonth.dart';
import 'package:flutteruiapp/payslip/datepicker.dart';
import 'package:flutteruiapp/payslip/paysummary.dart';
import 'package:flutteruiapp/payslip/taxform.dart';
import 'package:flutteruiapp/leave/applyencashment.dart';
import 'package:flutteruiapp/leave/applyleave.dart';
import 'package:flutteruiapp/leave/getencashment.dart';
import 'package:flutteruiapp/leave/leavebalance.dart';
import 'package:flutteruiapp/leave/overtime.dart';
import 'package:flutteruiapp/reimbursement/getreimbursement.dart';
import 'package:flutteruiapp/reimbursement/submitreimbursement.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.payslipView: (BuildContext context) => ViewPayslip(),
        UIData.paySummary: (BuildContext context) => PaySummary(),
        UIData.taxForm: (BuildContext context) => TaxForm(),
        UIData.applyEncashment: (BuildContext context) => ApplyEncashment(),
        UIData.applyLeave: (BuildContext context) => ApplyLeave(),
        UIData.getEncashmentDetails: (BuildContext context) => GetEncashment(),
        UIData.leaveBalance: (BuildContext context) => LeaveBalance(),
        UIData.overTimeDetails: (BuildContext context) => OverTime(),
        UIData.getReimbursementDetails: (BuildContext context) =>
            GetReimbursement(),
        UIData.submitReimbursement: (BuildContext context) =>
            SubmitReimbursement(),
        UIData.loginPage: (BuildContext context) =>
            LoginPage(),
      },
    );
  }
}
