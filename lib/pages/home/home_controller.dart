import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    _auth.signOut();

    await getDialogBox(
      "Good Bye",
      "Successsfully Logout",
      kWarning(),
    );

    Get.offAllNamed(Routes.login);
  }

//   //! --------------------------------------location

//   RxDouble latitude = RxDouble(0.0);
//   RxDouble longitude = RxDouble(0.0);
//   RxList<Placemark> lp = RxList();

//   void setupPosition() async {
//     Position position = await determinePosition();
//     latitude.value = position.latitude;
//     longitude.value = position.longitude;

//     lp.value = await getAddress();

//     GoogleGeocodingResponse geores = await geocode();

//     for (var element in geores.results) {
//       Logger().i(element.formattedAddress);
//     }
//   }

//   /// Determine the current position of the device.
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.

//   Future<Position> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       permission = await Geolocator.requestPermission();

//       return Future.error(
//         getDialogBox(
//           'Services are disabled',
//           "Please enable location",
//           kError(),
//         ),
//       );
//     }

//     permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.

//         return Future.error(
//           getDialogBox(
//             'Denide',
//             "Permisions denide",
//             kError(),
//           ),
//         );
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }
//   //!---------------------------------- Reverce geocoding

//   Future<List<Placemark>> getAddress() async {
//     List<Placemark> placemarks = [];
//     placemarks =
//         await placemarkFromCoordinates(latitude.value, longitude.value);

//     return placemarks;
//   }

//   Future<GoogleGeocodingResponse> geocode() async {
//     //setup latlang
//     String latlang = "${latitude.value},${longitude.value}";
//     const String googelApiKey = 'AIzaSyBZPPQb1d57wobrQUn4njKLPHmsHEoDRU0';
//     const bool isDebugMode = true;
//     final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
//     return await api.reverse(
//       latlang,
//       language: 'en',
//     );
//   }

// //!------------------------------ mesure the distance
//   Future<double> distance(double startLat, startLog, endLat, endLong) async {
//     double distanceInMeters = 0.0;
//     try {
//       distanceInMeters = Geolocator.distanceBetween(
//           52.2165157, 6.9437819, 52.3546274, 4.8285838);
//       return distanceInMeters;
//     } catch (e) {
//       getDialogBox(
//         "Error",
//         e.toString(),
//         kError(),
//       );
//       return distanceInMeters;
//     }
//  }
}
