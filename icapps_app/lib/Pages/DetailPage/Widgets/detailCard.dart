import 'package:flutter/material.dart';
import 'package:icapps_app/Models/brewery.dart';

class DetailCard extends StatelessWidget {
  final Brewery brewery;
  const DetailCard({Key? key, required this.brewery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(brewery.name),
        Text(brewery.city),
        Text(brewery.country),
        Text(brewery.address),
      ],
    );
  }
}
