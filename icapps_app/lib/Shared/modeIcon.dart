import 'package:flutter/material.dart';

class ModeIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function changeViewMode;
  const ModeIcon(
      {Key? key,
      required this.icon,
      required this.changeViewMode, required this.index, required this.selectedIndex,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeViewMode(index),
      child: Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 45,
            height: 45,
            color: index == selectedIndex
                ? Theme.of(context).cardColor
                : null,
            child: Icon(
              icon,
              color: index == selectedIndex
                  ? Theme.of(context).accentColor
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
