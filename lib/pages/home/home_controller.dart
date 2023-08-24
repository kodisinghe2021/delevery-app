import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    _auth.signOut();

    await getDialogBox(
      "Bye",
      "Successsfully Logout",
      kgray(),
    );

    Get.offAllNamed(Routes.login);
  }
}

