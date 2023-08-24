
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> getDialogBox(String title, String text, Color color) =>
    Get.defaultDialog(
      title: title,
      middleText: text,
      backgroundColor: color,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      radius: 10,
    );
