import 'package:flutter/material.dart';

class RatedToggle extends StatefulWidget {
  final Function setShowRated;
  const RatedToggle({Key? key, required this.setShowRated}) : super(key: key);

  @override
  _RatedToggleState createState() => _RatedToggleState();
}

class _RatedToggleState extends State<RatedToggle> {
  bool isSelected = true;

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
      widget.setShowRated(isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: toggleSelected,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 45,
            height: 45,
            color: isSelected ? Theme.of(context).cardColor : null,
            child: Icon(
              Icons.star_rounded,
              color: isSelected ? Theme.of(context).accentColor : null,
            ),
          ),
        ),
      ),
    );
  }
}
