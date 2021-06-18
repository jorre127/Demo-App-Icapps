import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/GridView/BeerGrid.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/ListView/beerList.dart';

class Viewtransitioni extends StatefulWidget {
  final List<Beer> beers;
  final int currentIndex;
  const Viewtransitioni({
    Key? key,
    required this.beers,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _ViewtransitioniState createState() => _ViewtransitioniState();
}

class _ViewtransitioniState extends State<Viewtransitioni> {
  List<Widget> views = [];
  @override
  void initState() {
    views = [BeerList(beers: widget.beers), BeerGrid(beers: widget.beers)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      child: views[widget.currentIndex],
      transitionBuilder: (Widget child, Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation) {
        return FadeThroughTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            child: child,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation);
      },
    );
  }
}
