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
      theme: ThemeData(),
      home: AuthenticationWrapper(),
      routes: {
        "/Home": (_) => HomePage(),
        "/Detail": (_) => DetailPage(),
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
  void selectWidget(SharedPreferences sharedPreferences) {
    setState(() {
      if (sharedPreferences.getString("Token") != null) {
        currentPage = HomePage();
      } else {
        currentPage = LoginPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((sharedPreferences) => selectWidget(sharedPreferences));
    return currentPage;
  }
}
