import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Shared/starRating.dart';

class DetailHeader extends StatelessWidget {
  final Beer beer;
  const DetailHeader({Key? key, required this.beer}) : super(key: key);

  void updateBeerRating(int newRating) {
    BeerService.updateRating(beer.id, newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          beer.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Spacer(),
        StarRating(
          beerRating: beer.rating,
          starSize: 35,
          enabled: true,
          updateRating: updateBeerRating,
        )
      ],
    );
  }
}
