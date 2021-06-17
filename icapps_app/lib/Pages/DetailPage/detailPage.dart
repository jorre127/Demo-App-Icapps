import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';

class DetailPage extends StatelessWidget {
  final beerId;
  const DetailPage({Key? key, required this.beerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: FutureBuilder(
          future: BeerService.getBeer(beerId),
          builder: (BuildContext context, AsyncSnapshot<Beer> data) {
            if (data.hasData) {
              return Text("Success");
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
