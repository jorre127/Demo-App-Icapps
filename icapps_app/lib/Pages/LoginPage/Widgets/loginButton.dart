import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isActive;
  final Function login;
  const LoginButton({Key? key, required this.isActive, required this.login})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => login(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context)
                      .accentColor
                      .withOpacity(isActive ? 0.4 : 0),
                  blurRadius: 12,
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(10),
            color: isActive
                ? Theme.of(context).accentColor
                : Theme.of(context).cardColor),
        height: 55,
        width: double.infinity,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
