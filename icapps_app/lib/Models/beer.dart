import 'package:icapps_app/Models/brewery.dart';

class Beer {
  String id;
  String name;
  int rating;
  String thumbImageUrl;
  String imageUrl;
  Brewery brewery;

  Beer(
      {required this.id,
      required this.name,
      required this.rating,
      required this.thumbImageUrl,
      required this.imageUrl,
      required this.brewery});

  factory Beer.fromJson(Map<String, dynamic> jsonData) {
    return Beer(
        id: jsonData["id"],
        name: jsonData["name"],
        rating: jsonData["rating"],
        thumbImageUrl: jsonData["thumbImageUrl"],
        imageUrl: jsonData["imageUrl"],
        brewery: Brewery.fromJson(jsonData["brewery"]));
  }
}
