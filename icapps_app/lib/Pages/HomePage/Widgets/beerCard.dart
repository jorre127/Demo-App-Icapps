import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;
  const BeerCard({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(beer.name),
        subtitle: Text(beer.brewery.name),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(beer.thumbImageUrl),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
