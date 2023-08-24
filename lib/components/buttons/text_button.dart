import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    required this.text,
    required this.onTap,
    this.textColor,
    super.key,
  });
  final String text;
  final Function() onTap;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 15,
          color: textColor ?? kh1(),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
