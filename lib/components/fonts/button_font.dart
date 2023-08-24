import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text buttonText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
          color: kLight(), fontSize: 16, fontWeight: FontWeight.w600),
    );
