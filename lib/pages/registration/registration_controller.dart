import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class RegistrationController extends GetxController {
  //-------------- create firebse auth instnce
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //----------- initializing Texediting controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //--------------------------------login with email and password
  Future<void> loginWithEmail() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );
      getDialogBox(
        "Success",
        "You are welcome ${userCredential.user!.email}",
        kSuccess(),
      );
    } on FirebaseAuthException catch (e) {
      getDialogBox(
        "Login Error",
        e.code,
        kError(),
      );
    }
  }

  //----------------------------- Google login
  Future<void> loginWithGmail() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await getDialogBox(
        "Successfull",
        "Registration Success",
        kSuccess(),
      );

      Logger().i("Successfully logged ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
    }
  }
}
