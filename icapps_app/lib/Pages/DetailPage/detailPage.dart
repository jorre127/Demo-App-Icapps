import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailOverview.dart';

class DetailPage extends StatefulWidget {
  final String beerId;
  final String beerImage;
  const DetailPage({
    Key? key,
    required this.beerId,
    required this.beerImage,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Beer> beerFuture;

  @override
  void initState() {
    beerFuture = BeerService.getBeer(widget.beerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: beerFuture,
          builder: (BuildContext context, AsyncSnapshot<Beer> data) {
            return DetailOverview(
              beer: data.data,
              hasLoaded: data.hasData,
              beerImage: widget.beerImage,
            );
          },
        ),
      ),
    );
  }
}
