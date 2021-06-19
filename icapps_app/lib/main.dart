import 'package:flutter/material.dart';
import 'package:icapps_app/Pages/DetailPage/detailPage.dart';
import 'package:icapps_app/Pages/HomePage/homePage.dart';
import 'package:icapps_app/Pages/LoginPage/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Typography.whiteCupertino,
        cardColor: Color.fromARGB(255, 29, 28, 37),
        unselectedWidgetColor:Color.fromARGB(255, 49, 48, 57) ,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        accentColor: Color.fromARGB(255, 45, 210, 163),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: LoginPage(),
      routes: {
        "/Home": (_) => HomePage(),
        "/Login": (_) => LoginPage(),
      },
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  Widget currentPage = LoginPage();
  void selectWidget() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString("Token") != null) {
        currentPage = HomePage();
      } else {
        currentPage = LoginPage();
      }
    });
  }

  @override
  void initState() {
    selectWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentPage;
  }
}
