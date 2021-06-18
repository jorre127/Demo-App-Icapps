import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailOverview.dart';

class DetailPage extends StatelessWidget {
  final String beerId;
  final String beerImage;
  const DetailPage({
    Key? key,
    required this.beerId,
    required this.beerImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: BeerService.getBeer(beerId),
          builder: (BuildContext context, AsyncSnapshot<Beer> data) {
            return DetailOverview(
              beer: data.data,
              hasLoaded: data.hasData,
              beerImage: beerImage,
            );
          },
        ),
      ),
    );
  }
}
