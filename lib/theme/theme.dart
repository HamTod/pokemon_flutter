import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon2/tools/helper.dart';

const primaryColor = '#47c68f';
const secondaryColor = '#e1f9ec';

class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: hexToColor(primaryColor),
    primarySwatch: colorToMaterialColor(hexToColor(primaryColor)),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade200,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily:
              GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
        )),
    scaffoldBackgroundColor: Colors.grey.shade200,
    buttonTheme: ButtonThemeData(
      buttonColor: hexToColor(primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: hexToColor(primaryColor)),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(hexToColor(primaryColor)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    textTheme: const TextTheme(titleMedium: TextStyle(fontSize: 16)),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: hexToColor(primaryColor),
      color: hexToColor(
          primaryColor), // Set the desired color for CircularProgressIndicator here
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: hexToColor(primaryColor),
        unselectedItemColor: Colors.grey),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Colors.blueGrey, // Set AppBar background color for dark theme
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorToMaterialColor(Colors
          .blueGrey), // Set the desired color for CircularProgressIndicator here
    ),
  );
}
