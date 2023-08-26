import 'dart:ui';

import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:delever_app/components/buttons/car_button.dart';
import 'package:delever_app/components/buttons/my_location_btn.dart';
import 'package:delever_app/components/cards/car_card.dart';
import 'package:delever_app/components/mrker_dot.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/map/google_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logger/logger.dart';

class GoogleMapPage extends StatelessWidget {
  GoogleMapPage({super.key});

  final GoogleMapPageController getController =
      Get.put<GoogleMapPageController>(GoogleMapPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: getScreenSize(context).width,
          height: getScreenSize(context).height,
          child: Stack(
            children: [
              CustomGoogleMapMarkerBuilder(
                customMarkers: [
                  // this merker from the API..........................
                  MarkerData(
                    marker: Marker(
                      markerId: const MarkerId('id-1'),
                      position: getController.createCarObject().latLng,
                      onTap: () => getController.showCarCard(),
                    ),
                    child: MarkerDot(
                      imgURL: getController.createCarObject().iconURL,
                    ),
                  ),

                  // current position merker............................
                  if (getController.isLatLngSetted.value)
                    MarkerData(
                      marker: Marker(
                        markerId: const MarkerId('origin'),
                        position: getController.currentLatLang,
                      ),
                      child: const MarkerDot(
                        imgURL:
                            'https://img.icons8.com/color/48/human-head.png',
                      ),
                    ),
                ],
                builder: (BuildContext context, Set<Marker>? markers) {
                  return GoogleMap(
                    initialCameraPosition: getController.initialPosition,
                    onMapCreated: (GoogleMapController controller) {
                      getController.googleMapController.complete(controller);
                    },
                    markers: markers ?? {},
                    polylines: getController.isPolylineActivated.value
                        ? {
                            Polyline(
                              polylineId: const PolylineId("tr-1"),
                              points: getController.latlangList,
                              width: 6,
                              color: kPolyline(),
                              zIndex: 1,
                            ),
                          }
                        : {},
                  );
                },
              ),

              Visibility(
                visible: getController.carCardVisibility.value,
                child: Positioned(
                  bottom: 15,
                  left: 10,
                  right: 10,
                  child: CarCard(),
                ),
              ),

              Visibility(
                visible: !getController.carCardVisibility.value,
                child: Positioned(
                  bottom: 15,
                  left: getScreenSize(context).width * .25,
                  child: FindButton(),
                ),
              ),

              //!--------------------------- verified
              Positioned(
                bottom: 110,
                right: 10,
                child: MyLocationButton(),
              ),
              //!--------------------------- verified END

              Positioned(
                top: 50,
                left: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                    child: Container(
                      width: getScreenSize(context).width * .9,
                      height: getScreenSize(context).height * .06,
                      decoration: BoxDecoration(
                        color: kLight().withOpacity(.9),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 2,
                          color: kLight().withOpacity(0.9),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Bootstrap.search,
                              color: kh3(),
                            ),
                          ),
                          SizedBox(
                            width: getScreenSize(context).width * .7,
                            height: getScreenSize(context).height * .06,
                            child: TextFormField(
                              controller: getController.search,
                              onChanged: (value) {
                                Logger().i(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: kh3(),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
