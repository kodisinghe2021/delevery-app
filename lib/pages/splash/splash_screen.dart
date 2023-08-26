import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading...",
            style: GoogleFonts.acme(),
          ),
        ],
      ),
    ));
  }
}
