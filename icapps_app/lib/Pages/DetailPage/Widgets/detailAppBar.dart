import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final beerImage;
  const DetailAppBar({
    Key? key, required this.beerImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      stretch: true,
      pinned: true,
      snap: false,
      expandedHeight: 260,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          beerImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
