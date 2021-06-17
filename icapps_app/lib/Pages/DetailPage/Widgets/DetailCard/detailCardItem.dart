import 'package:flutter/material.dart';

class DetailCardItem extends StatelessWidget {
  final String label;
  final String value;
  const DetailCardItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            label + ": ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
