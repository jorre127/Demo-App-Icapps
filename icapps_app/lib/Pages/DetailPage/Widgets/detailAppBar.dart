import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailAppBar extends StatelessWidget {
  final beerImage;
  const DetailAppBar({
    Key? key, required this.beerImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      backgroundColor: Colors.transparent,
      stretch: true,
      pinned: true,
      snap: false,
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          fadeInDuration: Duration(milliseconds: 100),
          imageUrl: beerImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
