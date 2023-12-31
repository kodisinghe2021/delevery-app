import 'package:delever_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    await userState();
    super.onReady();
  }

  Future<void> userState() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () => Get.offAllNamed(Routes.onboard),
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () => Get.offAllNamed(Routes.home),
        );
      }
    });
  }
}
