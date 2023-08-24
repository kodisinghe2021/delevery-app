import 'package:delever_app/pages/home/home_page.dart';
import 'package:delever_app/pages/login/login_page.dart';
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

    // splash screen get page
    GetPage(
      name: Routes.home,
      page: () =>  HomePage(),
    ),
    // splash screen get page
    GetPage(
      name: Routes.registration,
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
  ];
}
