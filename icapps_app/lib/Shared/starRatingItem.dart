import 'package:flutter/material.dart';

class StarRatingItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final double starSize;
  const StarRatingItem(
      {Key? key, required this.index, required this.selectedIndex, required this.starSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            color: index < selectedIndex
                ? Theme.of(context).accentColor.withOpacity(0.25)
                : Colors.transparent,
            blurRadius: 12,
            spreadRadius: -4)
      ]),
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 80),
        tween: Tween(begin: 0.0, end: index < selectedIndex ? 1.0 : 0.0),
        builder: (BuildContext context, double value, Widget? child) {
          return Stack(
            children: [
              Icon(Icons.star_border_rounded,
                  size: starSize, color: Theme.of(context).unselectedWidgetColor),
              Transform.scale(
                scale: value,
                child: Icon(Icons.star_rounded,
                    size: starSize, color: Theme.of(context).accentColor),
              )
            ],
          );
        },
      ),
    );
  }
}
