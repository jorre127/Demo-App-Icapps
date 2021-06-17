import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/beerList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).cardColor,),
      body: Center(
          child: FutureBuilder(
        future: BeerService.getBeers(),
        builder: (BuildContext context, AsyncSnapshot<List<Beer>> data) {
          if (data.hasData) {
            return BeerList(beers: data.data!);
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      )),
    );
  }
}
