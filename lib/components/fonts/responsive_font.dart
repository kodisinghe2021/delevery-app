import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class ResPonsiveFontRow extends StatelessWidget {
  const ResPonsiveFontRow({
    required this.text,
    this.fontColor,
    this.fontWeight,
    this.midSize,
    this.leftMargin,
    this.rightMargin,
    super.key,
  });
  final String text;
  final int? leftMargin;
  final int? rightMargin;
  final int? midSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: leftMargin ?? 1),
        Expanded(
          flex: midSize ?? 5,
          child: FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: fontWeight ?? FontWeight.bold,
                color: fontColor ?? kh1(),
                height: 1.3,
              ),
            ),
          ),
        ),
        Spacer(flex: rightMargin ?? 1),
      ],
    );
  }
}
