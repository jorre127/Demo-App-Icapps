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
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        return OpenContainer(
          useRootNavigator: true,
          closedColor: Colors.transparent,
          closedBuilder: (BuildContext context, void Function() action) {
            return BeerTile(beer: beers[index]);
          },
          openBuilder: (BuildContext context,
              void Function({Object? returnValue}) action) {
            return DetailPage(
              beerId: beers[index].id,
              beerImage: beers[index].imageUrl,
            );
          },
        );
      },
      itemCount: beers.length,
    );
  }
}
