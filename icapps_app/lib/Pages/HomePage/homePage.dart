import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/HomePage/Widgets/beerList.dart';
import 'package:icapps_app/Shared/modeIcon.dart';

enum ViewModes { listView, gridView }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Beer>> futureBeer;
  var currentViewMode = ViewModes.listView;
  void changeCurrentViewMode(ViewModes newMode) {
    setState(() {
      currentViewMode = newMode;
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
            viewMode: ViewModes.listView,
            changeViewMode: changeCurrentViewMode,
            currentViewMode: currentViewMode,
          ),
          ModeIcon(
            icon: Icons.grid_view_rounded,
            viewMode: ViewModes.gridView,
            changeViewMode: changeCurrentViewMode,
            currentViewMode: currentViewMode,
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
              switch (currentViewMode) {
                case ViewModes.listView:
                  return BeerList(beers: data.data!);
                case ViewModes.gridView:
                  return Text("gridview");
                default:
                  return BeerList(beers: data.data!);
              }
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
