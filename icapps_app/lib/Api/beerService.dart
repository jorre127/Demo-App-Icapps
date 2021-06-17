import 'dart:convert';

import 'package:http/http.dart';
import 'package:icapps_app/Models/beer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeerService {
  
  static Future<List<Beer>> getBeers() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var url =
        Uri.parse("http://icapps-nodejs-beers-api.herokuapp.com/api/v1/beers");
    var response = await get(url, headers: {
      "Authorization": "Bearer " + sharedPreferences.getString("Token")!
    });
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse["data"]
        .map<Beer>((beer) => Beer.fromJson(beer))
        .toList();
  }
}
