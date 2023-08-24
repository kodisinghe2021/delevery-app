import 'package:delever_app/components/fonts/button_font.dart';
import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    required this.onTap,
    super.key,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getScreenSize(context).height * .08,
        width: getScreenSize(context).width * .9,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(getScreenSize(context).width * .2 * .5),
          color: kredbtn(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              EvaIcons.google,
              color: Colors.white,
            ),
            //----------- gap
            const SizedBox(width: 10),
            buttonText('Google'),
          ],
        ),
      ),
    );
  }
}
