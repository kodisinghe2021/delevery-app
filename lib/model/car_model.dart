import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarModel {
  String name;
  String imgURL;
  String iconURL;
  LatLng latLng;

  CarModel({
    required this.name,
    required this.iconURL,
    required this.imgURL,
    required this.latLng,
  });
}
