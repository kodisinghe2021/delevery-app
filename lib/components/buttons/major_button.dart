import 'package:delever_app/components/fonts/button_font.dart';
import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';

class MajorButton extends StatelessWidget {
  const MajorButton({
    required this.text,
    required this.onTap,
    super.key,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getScreenSize(context).width * .9,
        height: getScreenSize(context).width * .15,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(getScreenSize(context).width * .2 * .5),
          color: kbuttonPrimer(),
        ),
        child: Center(
          child: buttonText(text),
        ),
      ),
    );
  }
}
