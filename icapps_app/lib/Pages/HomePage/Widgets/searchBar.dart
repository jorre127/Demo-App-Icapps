import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function setSearchTerm;
  const SearchBar({Key? key, required this.setSearchTerm}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: isFocused ? Theme.of(context).accentColor : null,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Focus(
                onFocusChange: (bool hasFocus) {
                  setState(() {
                    isFocused = hasFocus;
                  });
                },
                child: TextField(
                  onSubmitted: (String text)=>{
                    widget.setSearchTerm(text)
                  },
                  cursorColor: Theme.of(context).accentColor,
                  style: TextStyle(
                      color: isFocused ? Theme.of(context).accentColor : null),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
