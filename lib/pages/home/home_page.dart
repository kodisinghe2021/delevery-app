import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/home/home_controller.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController _controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Delevery App"),
          centerTitle: true,
          actions: [
            // right side icon
            SizedBox(
              width: getScreenSize(context).width * .2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.logout();
                    },
                    icon: const Icon(Icons.logout),
                  ),

                  // margin from right
                  SizedBox(width: getScreenSize(context).width * .02),
                ],
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: getScreenSize(context).width,
          height: getScreenSize(context).height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Go to Map"),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.googleMap);
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
