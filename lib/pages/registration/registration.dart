import 'package:delever_app/components/buttons/google_button.dart';
import 'package:delever_app/components/buttons/major_button.dart';
import 'package:delever_app/components/buttons/text_button.dart';
import 'package:delever_app/components/fonts/responsive_font.dart';
import 'package:delever_app/components/messages/get_dialog.dart';
import 'package:delever_app/components/text_field/custom_textfield.dart';
import 'package:delever_app/components/text_field/password_field.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final RegistrationController _controller =
      Get.put<RegistrationController>(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: getScreenSize(context).width * .9,
            height: getScreenSize(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //top gap
                SizedBox(height: getScreenSize(context).height * .17),

                //header
                SizedBox(
                  height: getScreenSize(context).height * .04,
                  width: getScreenSize(context).width,
                  child: const ResPonsiveFontRow(
                    text: 'Register Here!',
                    leftMargin: 2,
                    rightMargin: 2,
                  ),
                ),

                //description
                SizedBox(
                  height: getScreenSize(context).height * .04,
                  child: ResPonsiveFontRow(
                    text: 'Please enter your details here',
                    leftMargin: 2,
                    rightMargin: 2,
                    fontColor: kh3(),
                    fontWeight: FontWeight.normal,
                  ),
                ),

                //gap
                SizedBox(height: getScreenSize(context).height * .04),
                //---------------------------form
                Column(
                  children: [
                    //------------user mail
                    CustomTextField(
                      textController: _controller.email,
                      hint: "Email or phone number",
                      prefix: Icons.mail_outline,
                    ),

                    //------------------gap
                    SizedBox(height: getScreenSize(context).height * .02),

                    //--------------------password
                    PasswordField(
                      textController: _controller.password,
                      hint: "Password",
                      prefix: Icons.lock_outline,
                    ),

                    //----------------gap
                    const SizedBox(height: 10),
                  ],
                ),
                //------ gap
                SizedBox(height: getScreenSize(context).height * .05),
                Column(
                  children: [
                    //-----------------Login button
                    MajorButton(
                      text: "Register",
                      onTap: () async {
                        if (_controller.email.text.isNotEmpty &&
                            _controller.password.text.isNotEmpty) {
                          await _controller.loginWithEmail();
                        } else {
                          getDialogBox(
                            "Empty",
                            "Email or Password is Empty",
                            kWarning(),
                          );
                        }
                      },
                    ),

                    //-------------gap
                    SizedBox(height: getScreenSize(context).width * .04),

                    //------------------ text
                    ResPonsiveFontRow(
                      text: "Or continue with",
                      leftMargin: 5,
                      rightMargin: 5,
                      fontColor: kh3(),
                    ),

                    //-------------gap
                    SizedBox(height: getScreenSize(context).width * .04),

                    //------------- Google signin button
                    GoogleButton(
                      onTap: () async {
                        Logger().i("Clicked");
                        _controller.loginWithGmail();
                      },
                    ),

                    //-------------gap
                    SizedBox(height: getScreenSize(context).width * .04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: kh1(),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextBtn(
                          text: "Login",
                          textColor: kbuttonPrimer(),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    )
                  ],
                ),
                //------------------------ buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}
