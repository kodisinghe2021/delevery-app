import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
