import 'package:flutter/material.dart';
import 'package:icapps_app/Models/brewery.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/DetailCard/detailCardItem.dart';

class DetailCard extends StatelessWidget {
  final Brewery brewery;
  const DetailCard({Key? key, required this.brewery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailCardItem(label: "Brewery", value: brewery.name),
            DetailCardItem(label: "City", value: brewery.city),
            DetailCardItem(label: "Country", value: brewery.country),
            DetailCardItem(label: "Address", value: brewery.address),
          ],
        ),
      ),
    );
  }
}
