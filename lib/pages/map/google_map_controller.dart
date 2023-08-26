import 'dart:async';

import 'package:delever_app/api/car_locations.dart';
import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/model/car_model.dart';
import 'package:delever_app/utils/location_provider/get_current_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class GoogleMapPageController extends GetxController {
  Map<String, double> originCoordinates = {};

//!--------------------------------------------------------- verified
  RxBool carCardVisibility = RxBool(false);

  void showCarCard() async {
    await drawPolyline(
      createCarObject().latLng.latitude,
      createCarObject().latLng.longitude,
    );
    carCardVisibility.value = !carCardVisibility.value;
  }

  //^------------------------ API Data Latlng Setup
  LatLng getLatlng(Object? object) {
    return object as LatLng;
  }
  //^-------------------- create car model Object with API Data

  CarModel createCarObject() {
    Map<String, dynamic> carMap = APIData.carList[0];
    return CarModel(
      name: carMap['name'],
      iconURL: carMap['iconURL'],
      imgURL: carMap['imageURL'],
      latLng: carMap['latlng'],
    );
  }

  //^--------------------------------------------------- initial position
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(6.9271, 79.8583),
    zoom: 14.4746,
  );
  //^--------------------------------------------------- initial position END

  //^--------------------------------------------------- set Current Location
  // create object of the current location class
  final GetCurrentLocation _currentLocation = GetCurrentLocation();

  // set position map
  //&2
  Future<Map<String, double>> setCurrentLocation() async {
    //-- empty map for store coordinates
    Map<String, double> positionMap = {};

    //--- get position
    Position position = await _currentLocation.determinePosition();

    // --------- put valur into map
    positionMap.putIfAbsent('latitude', () => position.latitude);
    positionMap.putIfAbsent('longitude', () => position.longitude);

    return positionMap;
  }
  //^--------------------------------------------------- set Current Location END

  //^--------------------------------------------------- Setup Google map camera
  // initializing Google Map controller
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  //&1
  Future<void> setCameraPosition({LatLng? latLng}) async {
    Map<String, double> currentLocationMap = await setCurrentLocation();
    try {
      // --++++ create camera position
      CameraPosition cameraPosition = CameraPosition(
        //camera poit from north
        bearing: 0,

        // target location
        target: latLng ??
            LatLng(
              currentLocationMap['latitude'] ?? 0.0,
              currentLocationMap['longitude'] ?? 0.0,
            ),

        // camera angle
        tilt: 19.440717697143555,

        // zoom level
        zoom: 15.151926040649414,
      );

      // setup camrea position into map controller
      final GoogleMapController gmc = await googleMapController.future;

      await gmc.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (e) {
      getDialogBox(
        "ERROR",
        e.toString(),
        kError(),
      );
    }
  }

  //^--------------------------------------------------- Setup Google map camera END

  //^----------------------------------------------- Setup LatLang for current position
  late LatLng currentLatLang;
  RxBool isLatLngSetted = RxBool(false);

  Future<void> setLatLang() async {
    Map<String, double> map = await setCurrentLocation();
    currentLatLang = LatLng(
      map['latitude'] ?? 0.0,
      map['longitude'] ?? 0.0,
    );
    Logger().i("Latlng currently setted");
    isLatLngSetted.value = true;
  }
//^----------------------------------------------- Setup LatLang for current position END

//^----------------------------------------------- Setup Polyline START
  RxBool isPolylineActivated = RxBool(false);
  List<LatLng> latlangList = [];

//polyline maker
  Future<void> drawPolyline(
    destLatitude,
    destLongitude,
  ) async {
    PointLatLng originLatlang = PointLatLng(
      currentLatLang.latitude,
      currentLatLang.longitude,
    );
    PointLatLng destLatlang = PointLatLng(
      destLatitude,
      destLongitude,
    );

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey(),
      originLatlang,
      destLatlang,
    );

    latlangList = [];

    for (var i = 0; i < result.points.length; i++) {
      LatLng latlang = LatLng(
        result.points[i].latitude,
        result.points[i].longitude,
      );

      latlangList.add(latlang);
    }

    if (latlangList.isNotEmpty) {
      isPolylineActivated.value = true;
    }

    Logger().i(
        "Result length : ${result.points.length} --- latlangList Length : ${latlangList.length}");
  }

  //^ ---------------------------------------------------------- Search Bar Controller
  TextEditingController search = TextEditingController();
  
//!--------------------------------------------------------- verified END
}
