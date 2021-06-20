import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/detailPage.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/ListView/beerCard.dart';

class BeerList extends StatelessWidget {
  final List<Beer> beers;
  const BeerList({Key? key, required this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beers.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext contex) => DetailPage(
                          beerId: beers[index].id,
                          beerImage: beers[index].imageUrl,
                        ))),
            child: BeerCard(beer: beers[index]));
      },
    );
  }
}
