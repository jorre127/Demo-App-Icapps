import 'package:flutter/material.dart';
import 'package:icapps_app/Shared/modeIcon.dart';

class Header extends StatelessWidget {
  final Function changeCurrentViewMode;
  final int currentIndex;
  const Header(
      {Key? key,
      required this.changeCurrentViewMode,
      required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ModeIcon(
          icon: Icons.format_list_bulleted_rounded,
          changeViewMode: changeCurrentViewMode,
          index: 0,
          selectedIndex: currentIndex,
        ),
        ModeIcon(
          icon: Icons.grid_view_rounded,
          changeViewMode: changeCurrentViewMode,
          index: 1,
          selectedIndex: currentIndex,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
