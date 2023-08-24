import 'package:delever_app/components/buttons/google_button.dart';
import 'package:delever_app/components/buttons/major_button.dart';
import 'package:delever_app/components/buttons/text_button.dart';
import 'package:delever_app/components/fonts/responsive_font.dart';
import 'package:delever_app/components/text_field/main_textfield.dart';
import 'package:delever_app/constant.dart';
import 'package:delever_app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller =
      Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  text: 'Welcome Back!',
                  leftMargin: 2,
                  rightMargin: 2,
                ),
              ),

              //description
              SizedBox(
                height: getScreenSize(context).height * .04,
                child: ResPonsiveFontRow(
                  text: 'Please enter your account here',
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
                  MainTextField(
                    textController: TextEditingController(),
                    hint: "Email or phone number",
                    prefix: Icons.mail_outline,
                  ),

                  //------------------gap
                  SizedBox(height: getScreenSize(context).height * .02),

                  //--------------------password
                  MainTextField(
                    textController: TextEditingController(),
                    hint: "Password",
                    prefix: Icons.lock_outline,
                    suffixVisibility: true,
                  ),

                  //----------------gap
                  const SizedBox(height: 10),

                  //---------------------------- text button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextBtn(
                        text: "Forgot password?",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              //------ gap
              SizedBox(height: getScreenSize(context).height * .05),
              Column(
                children: [
                  //-----------------Login button
                  MajorButton(
                    text: "Login",
                    onTap: () {},
                    leftMargin: 13,
                    rightMargin: 13,
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
                        "Don't have nay account?",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: kh1(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextBtn(
                        text: "Sign Up",
                        textColor: kbuttonPrimer(),
                        onTap: () {},
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
    );
  }
}
