import 'package:cached_network_image/cached_network_image.dart';
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
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 100),
              width: 55,
              imageUrl: beer.thumbImageUrl,
              placeholder: (context, string) {
                return Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Theme.of(context).unselectedWidgetColor),
                );
              },
            ),
          ),
          trailing: Container(
            width: 135,
            child: Row(
              children: [
                StarRating(
                  beerRating: beer.rating,
                  starSize: 20,
                  enabled: false,
                ),
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
