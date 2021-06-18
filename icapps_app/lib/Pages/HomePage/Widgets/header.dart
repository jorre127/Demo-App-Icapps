import 'package:flutter/material.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/searchBar.dart';
import 'package:icapps_app/Shared/modeIcon.dart';

class Header extends StatelessWidget {
  final Function changeCurrentViewMode;
  final Function setSearchTerm;
  final int currentIndex;
  const Header(
      {Key? key,
      required this.changeCurrentViewMode,
      required this.currentIndex,
      required this.setSearchTerm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          SearchBar(setSearchTerm: setSearchTerm,),
          SizedBox(
            width: 20,
          ),
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
        ],
      ),
    );
  }
}
