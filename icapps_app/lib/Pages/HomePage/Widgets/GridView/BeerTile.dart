import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Shared/starRating.dart';

class BeerTile extends StatelessWidget {
  final Beer beer;
  const BeerTile({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                beer.thumbImageUrl,
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                beer.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                beer.brewery.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
              SizedBox(
                height: 4,
              ),
              StarRating(beerRating: beer.rating, starSize: 20, enabled: false)
            ],
          ),
        )
      ],
    );
  }
}
