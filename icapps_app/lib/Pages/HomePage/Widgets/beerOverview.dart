import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/GridView/BeerGrid.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/ListView/beerList.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/header.dart';

class BeerOverview extends StatefulWidget {
  final List<Beer> beers;
  final Function setSearchTerm;
  const BeerOverview({
    Key? key,
    required this.beers, required this.setSearchTerm,
  }) : super(key: key);

  @override
  _ViewtransitioniState createState() => _ViewtransitioniState();
}

class _ViewtransitioniState extends State<BeerOverview> {
  List<Widget> views = [];
  int currentIndex = 0;

  @override
  void initState() {
    views = [BeerList(beers: widget.beers), BeerGrid(beers: widget.beers)];
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BeerOverview oldWidget) {
    views = [BeerList(beers: widget.beers), BeerGrid(beers: widget.beers)];
    super.didUpdateWidget(oldWidget);
  }

  void changeCurrentViewMode(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(
            changeCurrentViewMode: changeCurrentViewMode,
            currentIndex: currentIndex,
            setSearchTerm: widget.setSearchTerm,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageTransitionSwitcher(
              child: views[currentIndex],
              transitionBuilder: (Widget child,
                  Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) {
                return FadeThroughTransition(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
