import 'package:flutter/material.dart';
import 'package:icapps_app/Shared/starRatingItem.dart';

class StarRating extends StatefulWidget {
  final int beerRating;
  final double starSize;
  final bool enabled;
  final Function? updateRating;
  const StarRating(
      {Key? key,
      required this.beerRating,
      required this.starSize,
      required this.enabled,
      this.updateRating})
      : super(key: key);

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
  void didUpdateWidget(covariant StarRating oldWidget) {
    setState(() {
          selectedIndex = widget.beerRating;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => GestureDetector(
              onTap: () => widget.enabled
                  ? {
                      widget.updateRating!(index + 1),
                      setSelectedIndex(index + 1)
                    }
                  : null,
              child: StarRatingItem(
                index: index,
                selectedIndex: selectedIndex,
                starSize: widget.starSize,
              ))),
    );
  }
}
