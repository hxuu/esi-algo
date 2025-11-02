import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WebColor {
  static const Color background = Color(0xfff8f7ff);
  static const Color primary = Color(0xff0062A3);
  static const Color secondary = Colors.grey;
}

class WebTextStyle {
  static TextStyle bigTextStyle = TextStyle(
    fontFamily: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
    ).fontFamily,
    fontSize: 48.sp,
    color: const Color(0xff001233),
  );
  static TextStyle midTextStyle = TextStyle(
    fontFamily: GoogleFonts.workSans().fontFamily,
    fontSize: 28.sp,
    color: const Color(0xff001233),
  );
  static TextStyle smallTextStyle = TextStyle(
    fontFamily: GoogleFonts.workSans(
      fontWeight: FontWeight.w300,
      fontSize: 18.sp,
    ).fontFamily,
    color: Colors.white,
  );
  static TextStyle navBarTextStyle = TextStyle(
    fontFamily: GoogleFonts.workSans(
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    ).fontFamily,
    color: const Color(0xff001233),
  );
}
