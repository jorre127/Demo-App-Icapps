import 'package:flutter/material.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/DetailCard/detailCard.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailAppBar.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailHeader.dart';
import 'package:icapps_app/Pages/DetailPage/Widgets/detailMap.dart';
import 'package:icapps_app/Shared/customProgressIndicator.dart';

class DetailOverview extends StatelessWidget {
  final Beer? beer;
  final String beerImage;
  final bool hasLoaded;
  const DetailOverview(
      {Key? key,
      required this.beer,
      required this.hasLoaded,
      required this.beerImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        DetailAppBar(
          beerImage: beerImage,
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          sliver: hasLoaded
              ? SliverList(
                  delegate: SliverChildListDelegate([
                  DetailHeader(
                    beer: beer!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailCard(brewery: beer!.brewery),
                  SizedBox(
                    height: 20,
                  ),
                  DetailMap(brewery: beer!.brewery,)
                ]))
              : SliverList(
                  delegate: SliverChildListDelegate(
                      [Center(child: CustomProgressIndicator())])),
        )
      ],
    );
  }
}
