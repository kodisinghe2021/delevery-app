import 'package:delever_app/pages/detail_deliver.dart';
import 'package:delever_app/pages/home/home_page.dart';
import 'package:delever_app/pages/login/login_page.dart';
import 'package:delever_app/pages/map/google_map.dart';
import 'package:delever_app/pages/onboard/onboard.dart';
import 'package:delever_app/pages/registration/registration.dart';
import 'package:delever_app/pages/splash/splash_screen.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.splash;
  static final routes = [
    // splash screen get page
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: Routes.onboard,
      page: () => OnBoardScreen(),
    ),

    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),

    GetPage(
      name: Routes.registration,
      page: () => RegistrationPage(),
    ),

    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),

    GetPage(
      name: Routes.googleMap,
      page: () => GoogleMapPage(),
    ),

    GetPage(
      name: Routes.detailDiliver,
      page: () => const DetailDeliver(),
    ),
  ];
}
