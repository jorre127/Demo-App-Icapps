import 'package:flutter/material.dart';
import 'package:icapps_app/Pages/HomePage/homePage.dart';

class ModeIcon extends StatelessWidget {
  final IconData icon;
  final ViewModes viewMode;
  final ViewModes currentViewMode;
  final Function changeViewMode;
  const ModeIcon(
      {Key? key,
      required this.icon,
      required this.viewMode,
      required this.changeViewMode,
      required this.currentViewMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeViewMode(viewMode),
      child: Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 45,
            height: 45,
            color: viewMode == currentViewMode
                ? Theme.of(context).cardColor
                : null,
            child: Icon(
              icon,
              color: viewMode == currentViewMode
                  ? Theme.of(context).accentColor
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
