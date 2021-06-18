import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/viewTransition.dart';
import 'package:icapps_app/Shared/modeIcon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Beer>> futureBeer;
  int currentIndex = 0;
  void changeCurrentViewMode(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

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
        backgroundColor: Colors.transparent,
        actions: [
          ModeIcon(
            icon: Icons.format_list_bulleted_rounded,
            changeViewMode: changeCurrentViewMode,
            index: 0,
            selectedIndex: currentIndex,
          ),
          ModeIcon(
            icon: Icons.grid_view_rounded,
            changeViewMode: changeCurrentViewMode,
            index: 1,
            selectedIndex: currentIndex,
          ),
          SizedBox(
            width: 20,
          )
        ],
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
              return Viewtransitioni(
                beers: data.data!,
                currentIndex: currentIndex,
              );
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
