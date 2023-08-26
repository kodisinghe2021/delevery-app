import 'package:delever_app/components/drag_line.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/map/google_map_controller.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CarCard extends StatelessWidget {
  CarCard({
    super.key,
  });

  final GoogleMapPageController getController =
      Get.put<GoogleMapPageController>(GoogleMapPageController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Get.toNamed(Routes.detailDiliver);
      },
      child: Container(
        width: getScreenSize(context).width * .95,
        height: getScreenSize(context).height * .1,
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
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: kBackGray(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          Image.asset(getController.createCarObject().imgURL),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        getController.createCarObject().name,
                        style: GoogleFonts.roboto(
                          color: kDark(),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Find nearest car",
                        style: GoogleFonts.roboto(
                          color: kDark(),
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        "5min",
                        style: GoogleFonts.roboto(
                          color: kh3(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: DragLine(),
            )
          ],
        ),
      ),
    );
  }
}
