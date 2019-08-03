import 'package:flutter/material.dart';
import 'package:flutteruiapp/util/uidata.dart';
import 'package:flutteruiapp/util/color_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutteruiapp/homepage/home_page.dart';
import 'package:flutteruiapp/login/loginobject.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;

class LoginPage extends StatefulWidget {
  LoginPage({this.prefs});

  final SharedPreferences prefs;

  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  String loginresponse = "";

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];
  // maintains validators and state of form fields
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;

  bool _isInvalidAsyncUser = false; // managed after response from server
  bool _isInvalidAsyncPass = false; // managed after response from server

  String _username;
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  String _password;
  String _empID;
  String _email;
  String _photo;
  bool _isLoggedIn = false;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    userController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  // validate user name
  String _validateUserName(String userName) {
    if (userName.length < 8) {
      return 'Username must be at least 8 characters';
    }

    if (_isInvalidAsyncUser) {
      // disable message until after next async call
      _isInvalidAsyncUser = false;
      return 'Incorrect user name';
    }

    return null;
  }

  // validate password
  String _validatePassword(String password) {
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (_isInvalidAsyncPass) {
      // disable message until after next async call
      _isInvalidAsyncPass = false;
      return 'Incorrect password';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  void loginAction() async {
    //if (_loginFormKey.currentState.validate()) {
    //_loginFormKey.currentState.save();

    // dismiss keyboard during async call
    FocusScope.of(context).requestFocus(new FocusNode());

    // start the modal progress HUD
    setState(() {
      _isInAsyncCall = true;
    });

    _username = userController.text;
    _password = pwdController.text;

    String envelope =
        "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" " +
            " xmlns:web=\"http://webservice.core.eba.com/\"> " +
            " <soapenv:Header/> " +
            " <soapenv:Body> " +
            "  <web:getUserProfile> " +
            "     <search> " +
            "        <companyId>" +
            UIData.companyId +
            "</companyId> " +
            "        <loginId>" +
            //"antony" +
            _username +
            "</loginId> " +
            "        <code>" +
            _password +
            //"antony@123" +
            "</code> " +
            "     </search> " +
            "  </web:getUserProfile> " +
            " </soapenv:Body> " +
            " </soapenv:Envelope> ";

    http.Response response = await http.post(
        "http://52.11.192.172:19080/coreConnectPayroll/WebService/PortalWebService",
        headers: {"Content-Type": "text/xml; charset=utf-8", "SOAPAction": ""},
        body: envelope);

    // The server's response should be the raw XML output.
    var rawXmlResponse = response.body;

    // Use the xml package's 'parse' method to parse the response.
    xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);

    LoginObject object =
        LoginObject(xml.parse(response.body).findAllElements("userProfile"));

    loginresponse = object.activeStatus;
    _empID = object.id;
    _email = object.email;
    _photo = object.photo;
    UIData.empID = _empID;

    setState(() {
      "Name:" +
          object.name +
          "\n" +
          "ID:" +
          object.id +
          "\n" +
          "Photo:" +
          object.photo +
          "\n" +
          "CompanyId:" +
          object.companyId +
          "\n" +
          "Email:" +
          object.email +
          "\n" +
          "ActiveStatus:" +
          object.activeStatus +
          "\n";
    });

    if (loginresponse == "Y") {
      // stop the modal progress HUD
      //_isInAsyncCall = false;
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black54);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(empID : _empID,name : _username,email: _email,photo: _photo),
        ),
      );
    } else {
      // stop the modal progress HUD
      //_isInAsyncCall = false;
      Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black54);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        ModalProgressHUD(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: buildLoginForm(context),
            ),
          ),
          inAsyncCall: _isInAsyncCall,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
        ),
        new Image(
          image: new AssetImage("assets/work.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle: new TextStyle(color: Colors.white, fontSize: 20.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*new FlutterLogo(
               size: _iconAnimation.value * 140.0,
              ),*/
              new Image(
                image: new AssetImage("assets/ebaconnectlogo.png"),
                height: 70.0,
                width: 120.0,
                //colorBlendMode: BlendMode.darken,
                //color: Colors.black54,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                child: TextField(
                  key: Key("userID"),
                  maxLines: 1,
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    labelText: "Username",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: TextField(
                  key: Key("password"),
                  maxLines: 1,
                  obscureText: true,
                  controller: pwdController,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 100.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    loginAction();
                  },
                ),
              ),
              ColorLoader(
                colors: colors,
                duration: Duration(milliseconds: 1200),
              ),
              SizedBox(
                height: 5.0,
              ),
              /*Text(
                "SIGN UP FOR AN ACCOUNT",
                style: TextStyle(color: Colors.grey),
              ),*/
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // run the validators on reload to process async results
    _loginFormKey.currentState?.validate();
    return new Scaffold(
      key: this._loginFormKey,
    );
  }
}
