import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Shared/starRating.dart';
import 'package:icapps_app/Shared/starRatingItem.dart';

class DetailHeader extends StatelessWidget {
  final Beer beer;
  const DetailHeader({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          beer.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Spacer(),
        StarRating(beerRating: beer.rating,)
      ],
    );
  }
}
