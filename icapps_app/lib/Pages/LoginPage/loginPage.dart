import 'package:flutter/material.dart';
import 'package:icapps_app/Api/authenticationService.dart';
import 'package:icapps_app/Pages/LoginPage/Widgets/loginButton.dart';
import 'package:icapps_app/Pages/LoginPage/Widgets/loginInput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailAdress = "";
  String password = "";
  void logIn(BuildContext context) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    AuthenticationService.logIn(emailAdress, password).then((value) => {
          if (value.isNotEmpty)
            {
              sharedPreferences.setString("Token", value),
              Navigator.of(context).pushNamed("/Home")
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Wrong credentials, try again."),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Theme.of(context).cardColor,
              ))
            }
        });
  }

  void updateEmail(String newEmail) {
    setState(() {
      emailAdress = newEmail;
    });
  }

  void updatePassword(String newPassword) {
    setState(() {
      password = newPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Icapps",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                LoginInput(
                  label: "Email Address",
                  updateText: updateEmail,
                  isPassword: false,
                ),
                SizedBox(
                  height: 13,
                ),
                LoginInput(
                  label: "Password",
                  updateText: updatePassword,
                  isPassword: true,
                ),
                SizedBox(
                  height: 25,
                ),
                LoginButton(
                  isActive: emailAdress.isNotEmpty && password.isNotEmpty,
                  login: () => logIn(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
