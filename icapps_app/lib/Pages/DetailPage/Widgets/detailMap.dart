import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icapps_app/Models/brewery.dart';
import 'package:geocoding/geocoding.dart';

class DetailMap extends StatefulWidget {
  final Brewery brewery;
  const DetailMap({Key? key, required this.brewery}) : super(key: key);

  @override
  _DetailMapState createState() => _DetailMapState();
}

class _DetailMapState extends State<DetailMap> {
  final Map<String, Marker> markers = {};
  bool show = false;

  void onMapCreated(GoogleMapController controller) async {
    var address = widget.brewery.address + widget.brewery.city;
    var addresses = await locationFromAddress(address);
    var first = addresses.first;
    setState(() {
      markers.clear();
      final marker = Marker(
          infoWindow: InfoWindow(title: widget.brewery.name),
          markerId: MarkerId("0"),
          position: LatLng(first.latitude, first.longitude));
      markers["0"] = marker;
      controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 14,
          target: LatLng(markers["0"]!.position.latitude,
              markers["0"]!.position.longitude))));
    });
    show = true;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 250,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 250),
            tween: Tween(begin: 0.0, end: show? 1.0 : 0.0),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child: GoogleMap(
                    markers: markers.values.toSet(),
                    onMapCreated: onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: const LatLng(0, 0),
                      zoom: 14,
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
