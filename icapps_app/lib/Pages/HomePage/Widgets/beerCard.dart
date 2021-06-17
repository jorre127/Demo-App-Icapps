import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Shared/starRating.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;
  const BeerCard({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: ListTile(
          title: Text(beer.name),
          subtitle: Text(beer.brewery.name),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(beer.thumbImageUrl),
          ),
          trailing: Container(
            width: 135,
            child: Row(
              children: [
                StarRating(beerRating: beer.rating, starSize: 20),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
