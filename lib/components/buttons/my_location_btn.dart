import 'dart:ui';

import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/map/google_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocationButton extends StatelessWidget {
  MyLocationButton({
    super.key,
  });

  final GoogleMapPageController getController =
      Get.put<GoogleMapPageController>(GoogleMapPageController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await getController.setCameraPosition();
        //---- set current position as lantlng
        await getController.setLatLang();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: getScreenSize(context).width * .15,
            height: getScreenSize(context).height * .05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.7),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: kredbtn(),
                  size: 40,
                ),
                // Text(
                //   "My Location",
                //   style: GoogleFonts.aboreto(
                //     fontSize: 15,
                //     color: kredbtn(),
                //     fontWeight: FontWeight.bold,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
