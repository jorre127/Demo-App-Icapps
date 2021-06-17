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
          .map((beer) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext contex) => DetailPage(
                            beerId: beer.id,
                          ))),
              child: BeerTile(beer: beer)))
          .toList(),
    );
  }
}
