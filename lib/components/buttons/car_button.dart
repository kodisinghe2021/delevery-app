import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/map/google_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FindButton extends StatelessWidget {
  FindButton({
    super.key,
  });
  final GoogleMapPageController getController =
      Get.put<GoogleMapPageController>(GoogleMapPageController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getController.setCameraPosition(
          latLng: getController.createCarObject().latLng,
        );
      },
      child: Container(
        width: getScreenSize(context).width * .5,
        height: getScreenSize(context).height * .07,
        decoration: BoxDecoration(
          color: kLight(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.54),
              offset: const Offset(0, 6),
              blurRadius: 19,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Center(
            child: Text(
          "Show Taxi",
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
    );
  }
}
