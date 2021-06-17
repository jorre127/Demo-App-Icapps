class Brewery {
  String id;
  String name;
  String address;
  String city;
  String country;

  Brewery(
      {required this.id,
      required this.name,
      required this.address,
      required this.city,
      required this.country});

  factory Brewery.fromJson(Map<String, dynamic> jsonData) {
    return Brewery(
        id: jsonData["id"],
        name: jsonData["name"],
        address: jsonData["address"],
        city: jsonData["city"],
        country: jsonData["country"]);
  }
}
