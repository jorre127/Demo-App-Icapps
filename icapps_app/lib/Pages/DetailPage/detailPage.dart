import 'package:flutter/material.dart';

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
        child: Text("detail page "+beerId),
      ),
    );
  }
}
