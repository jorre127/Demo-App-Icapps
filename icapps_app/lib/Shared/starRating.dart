import 'package:flutter/material.dart';
import 'package:icapps_app/Shared/starRatingItem.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  var selectedIndex = 0;
  void setSelectedIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => GestureDetector(
              onTap: () => setSelectedIndex(index + 1),
              child:
                  StarRatingItem(index: index, selectedIndex: selectedIndex))),
    );
  }
}
