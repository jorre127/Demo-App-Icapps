import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailCardItem extends StatelessWidget {
  final String label;
  final String value;
  final String svgName;
  const DetailCardItem(
      {Key? key,
      required this.label,
      required this.value,
      required this.svgName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SvgPicture.asset(
            svgName,
            color: Theme.of(context).accentColor,
            width: 25,
          ),
          SizedBox(width: 10,),
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
