import 'dart:ui';

import 'package:delever_app/api/car_locations.dart';
import 'package:delever_app/components/drag_line.dart';
import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailDeliver extends StatelessWidget {
  const DetailDeliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: getScreenSize(context).width,
        height: getScreenSize(context).height,
        child: Stack(
          children: [
            //^--- background image
            Image.asset(
              'assets/images/pm.jpg',
              fit: BoxFit.fill,
              width: getScreenSize(context).width,
              height: getScreenSize(context).height * .7,
            ),

            const Positioned(
              top: 60,
              left: 30,
              child: RoundBackButton(),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: getScreenSize(context).width,
                height: getScreenSize(context).height * .65,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: kLight(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const DragLine(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 27,
                      ),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              DesH1(text: "Truck_03"),
                            ],
                          ),
                          SizedBox(height: getScreenSize(context).height * .02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const DesFont(text: "Pol"),
                              const SizedBox(width: 20),
                              Container(
                                width: 5,
                                height: 5,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kh3(),
                                ),
                              ),
                              const DesFont(text: "60 mins"),
                            ],
                          ),
                          SizedBox(height: getScreenSize(context).height * .02),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/f.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(width: 7),
                              const DesH1(text: "Elena Shelby"),
                            ],
                          ),
                          SizedBox(height: getScreenSize(context).height * .02),
                          const Divider(thickness: 2),
                          SizedBox(height: getScreenSize(context).height * .02),
                          const Row(
                            children: [
                              DesH1(text: "Details"),
                            ],
                          ),
                          SizedBox(height: getScreenSize(context).height * .01),
                          DesFont(
                            text: APIData.carList[0]['description'].toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DesFont extends StatelessWidget {
  const DesFont({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: kh3(),
      ),
    );
  }
}

class DesH1 extends StatelessWidget {
  const DesH1({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: fontBlue(),
      ),
    );
  }
}

class RoundBackButton extends StatelessWidget {
  const RoundBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: kLight().withOpacity(.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.chevron_left,
                color: kLight(),
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
