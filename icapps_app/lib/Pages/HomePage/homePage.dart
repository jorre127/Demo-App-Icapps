import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/beerList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Beer>> futureBeer;

  @override
  void initState() {
    futureBeer = BeerService.getBeers();
    super.initState();
  }

  Future refreshBeers() async {
    setState(() {
      futureBeer = BeerService.getBeers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Center(
          child: RefreshIndicator(
        backgroundColor: Theme.of(context).cardColor,
        color: Theme.of(context).accentColor,
        onRefresh: refreshBeers,
        child: FutureBuilder(
          future: futureBeer,
          builder: (BuildContext context, AsyncSnapshot<List<Beer>> data) {
            if (data.hasData) {
              return BeerList(beers: data.data!);
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      )),
    );
  }
}
