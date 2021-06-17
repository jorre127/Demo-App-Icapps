import 'package:flutter/material.dart';
import 'package:icapps_app/Api/authenticationService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void logIn(BuildContext context) async {
    print("fires");
    var sharedPreferences = await SharedPreferences.getInstance();
    AuthenticationService.logIn("star_developer@icapps.com", "developer")
        .then((value) => sharedPreferences.setString("Token", value));
    Navigator.of(context).pushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Log In"),
          onPressed: () => logIn(context),
        ),
      ),
    );
  }
}
