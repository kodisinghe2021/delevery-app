import 'package:delever_app/components/buttons/major_button.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/splash/splash_controller.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/fonts/responsive_font.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController _controller =
      Get.put<SplashController>(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: getScreenSize(context).width,
      height: getScreenSize(context).height,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Image.asset(
              'assets/images/world.png',
              width: getScreenSize(context).width * .9,
              height: getScreenSize(context).width * .9,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ResPonsiveFontRow(
                  text: "Initiating Global Deliveries",
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //-----------keep gap between header and the descrition
                SizedBox(
                  height: getScreenSize(context).height * .02,
                ),
                //----------------------------------
                ResPonsiveFontRow(
                  text:
                      "Step into a world of seamless\ncargo servies\nwelcome to our community!",
                  fontColor: kh3(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MajorButton(
                  text: "Get started",
                  onTap: () async {
                    Get.offAllNamed(Routes.login);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
