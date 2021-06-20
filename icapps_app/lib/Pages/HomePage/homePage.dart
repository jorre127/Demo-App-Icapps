import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/beerOverview.dart';
import 'package:icapps_app/Shared/customProgressIndicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Beer>> futureBeer;
  String searchTerm = "";
  bool showRated = true;

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

  void setSearchTerm(String newTerm) {
    setState(() {
      searchTerm = newTerm;
    });
  }

  void setShowRated(bool show) {
    setState(() {
      showRated = show;
    });
  }

  List<Beer> filterBeers(List<Beer> beers) {
    var filteredBeers = beers
        .where((element) =>
            element.name.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
    if (!showRated) {
      filteredBeers = filteredBeers.where((beer) => beer.rating == 0).toList();
    }

    return filteredBeers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RefreshIndicator(
        backgroundColor: Theme.of(context).cardColor,
        color: Theme.of(context).accentColor,
        onRefresh: refreshBeers,
        child: FutureBuilder(
          future: futureBeer,
          builder: (BuildContext context, AsyncSnapshot<List<Beer>> data) {
            if (data.hasData) {
              return BeerOverview(
                beers: filterBeers(data.data!),
                setSearchTerm: setSearchTerm,
                setShowRated: setShowRated,
              );
            } else
              return Center(
                child: CustomProgressIndicator(),
              );
          },
        ),
      )),
    );
  }
}
