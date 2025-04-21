import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra_library_app/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: KprimaryColor,
    brightness: Brightness.light,
    textTheme: GoogleFonts.montserratTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}
