import 'package:delever_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class OnboardController extends GetxController {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    await userState();
    super.onReady();
  }

  Future<void> userState() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().i("User null ${user!.email}");
        Future.delayed(
          const Duration(milliseconds: 1000),
          () => Get.toNamed(Routes.login),
        );
      } else {
        Logger().i("User Available ${user.email}");

        Future.delayed(
          const Duration(milliseconds: 1000),
          () => Get.toNamed(Routes.home),
        );
      }
    });
  }
}
