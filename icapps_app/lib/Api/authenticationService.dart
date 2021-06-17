import 'dart:convert';

import 'package:http/http.dart';

class AuthenticationService {
  
  static Future<String> logIn(String email, String password) async {
    var url = Uri.parse(
        "http://icapps-nodejs-beers-api.herokuapp.com/api/v1/auth/login");
    var response = await post(url, body: {
      "username": email,
      "password": password,
    });
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse["data"]["accessToken"];
  }
}
