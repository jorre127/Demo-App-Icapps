import 'package:flutter/material.dart';
import 'package:icapps_app/Shared/starRatingItem.dart';

class StarRating extends StatefulWidget {
  final beerRating;
  const StarRating({Key? key, required this.beerRating}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState(selectedIndex: beerRating);
}

class _StarRatingState extends State<StarRating> {
  int selectedIndex;
  _StarRatingState({required this.selectedIndex});
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
              child: StarRatingItem(index: index, selectedIndex: selectedIndex))),
    );
  }
}
