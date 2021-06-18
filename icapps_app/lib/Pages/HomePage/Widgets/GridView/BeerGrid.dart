import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/detailPage.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/GridView/BeerTile.dart';

class BeerGrid extends StatelessWidget {
  final List<Beer> beers;
  const BeerGrid({Key? key, required this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1 / 1.4,
      crossAxisCount: 2,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: beers
          .map((beer) => OpenContainer(
            useRootNavigator: true,
            closedColor: Colors.transparent,
                closedBuilder: (BuildContext context, void Function() action) {
                  return BeerTile(beer: beer);
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return DetailPage(
                    beerId: beer.id,
                    beerImage: beer.imageUrl,
                  );
                },
              ))
          .toList(),
    );
  }
}
