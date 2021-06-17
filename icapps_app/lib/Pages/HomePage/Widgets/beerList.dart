import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/detailPage.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/beerCard.dart';

class BeerList extends StatelessWidget {
  final List<Beer> beers;
  const BeerList({Key? key, required this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: beers
          .map((beer) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext contex) => DetailPage(
                            beerId: beer.id,
                          ))),
              child: BeerCard(beer: beer)))
          .toList(),
    );
  }
}
