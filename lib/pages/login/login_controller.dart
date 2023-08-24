import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {

  
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
        "Login Success",
        kSuccess(),
      );


      Logger().i("Successfully logged ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
    }
  }
}
