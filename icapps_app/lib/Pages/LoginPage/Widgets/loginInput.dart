import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final String label;
  final Function updateText;
  final bool isPassword;
  const LoginInput({Key? key, required this.label, required this.updateText, required this.isPassword})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context)
                    .accentColor
                    .withOpacity(isFocused ? 0.4 : 0),
                blurRadius: 7)
          ],
          border: Border.all(
              width: 0.4,
              color: isFocused
                  ? Theme.of(context).accentColor
                  : Colors.transparent),
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Focus(
          onFocusChange: (bool focus) {
            setState(() {
              isFocused = focus;
            });
          },
          child: TextField(
            obscureText:  widget.isPassword ? true: false,
            onChanged: (String text) {
              widget.updateText(text);
            },
            cursorColor: Theme.of(context).accentColor,
            style: TextStyle(color: Theme.of(context).accentColor),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.label,
                labelStyle: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
