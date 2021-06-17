import 'package:flutter/material.dart';
import 'package:icapps_app/Api/beerService.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/DetailCard/detailCard.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailAppBar.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailHeader.dart';

class DetailPage extends StatelessWidget {
  final beerId;
  const DetailPage({
    Key? key,
    required this.beerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: BeerService.getBeer(beerId),
          builder: (BuildContext context, AsyncSnapshot<Beer> data) {
            if (data.hasData) {
              return CustomScrollView(
                slivers: [
                  DetailAppBar(
                    beerImage: data.data!.imageUrl,
                  ),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      DetailHeader(
                        beer: data.data!,
                      ),
                      SizedBox(height: 20,),
                      DetailCard(brewery: data.data!.brewery)
                    ])),
                  )
                ],
              );
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
