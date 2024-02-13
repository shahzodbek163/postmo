import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle f16w400 = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static TextStyle f16w500 = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle f20w600 = GoogleFonts.ubuntu(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle f30w700 = GoogleFonts.ubuntu(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle f27w700 = GoogleFonts.ubuntu(
    fontSize: 27,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle h2Semibold18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF303030),
  );
  static TextStyle bodyNormalRegular = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF303030),
  );
}
