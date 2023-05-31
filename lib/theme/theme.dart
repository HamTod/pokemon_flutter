import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon2/tools/helper.dart';

const primaryColor = '#8f47c6'; //สีเมนูที่เลือก
const secondaryColor = '#00C9A7';

class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: hexToColor(primaryColor),
    primarySwatch: colorToMaterialColor(hexToColor(primaryColor)),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
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

  // static final darkTheme = ThemeData(
  //   primaryColor: hexToColor(primaryColor),
  //   primarySwatch: colorToMaterialColor(hexToColor(primaryColor)),
  //   fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
  //   brightness: Brightness.light,
  //   appBarTheme: AppBarTheme(
  //       backgroundColor: Colors.deepPurple,
  //       elevation: 1,
  //       centerTitle: true,
  //       titleTextStyle: TextStyle(
  //         color: Colors.white,
  //         fontSize: 18,
  //         fontFamily:
  //             GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
  //       )),
  //   scaffoldBackgroundColor: const Color(0xff0C134F),
  //   buttonTheme: ButtonThemeData(
  //     buttonColor: hexToColor(primaryColor),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //       side: BorderSide(color: hexToColor(primaryColor)),
  //     ),
  //     textTheme: ButtonTextTheme.primary,
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //       backgroundColor: MaterialStateProperty.all(hexToColor(primaryColor)),
  //       foregroundColor: MaterialStateProperty.all(Colors.white),
  //     ),
  //   ),
  //   textTheme: const TextTheme(titleMedium: TextStyle(fontSize: 16)),
  //   progressIndicatorTheme: ProgressIndicatorThemeData(
  //     circularTrackColor: hexToColor(primaryColor),
  //     color: hexToColor(
  //         primaryColor), // Set the desired color for CircularProgressIndicator here
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       backgroundColor: const Color(0xff5C469C),
  //       selectedItemColor: hexToColor(secondaryColor),
  //       unselectedItemColor: Colors.grey.shade200),
  // );

  static final darkTheme = ThemeData(
    primarySwatch: colorToMaterialColor(const Color(0xFF0C134F)),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Colors.deepPurple, // Set AppBar background color for dark theme
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    scaffoldBackgroundColor: const Color(0xFF1c0e27),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF59406C),
        selectedItemColor: hexToColor(secondaryColor),
        unselectedItemColor: Colors.grey.shade200),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorToMaterialColor(const Color(
          0xFF0C134F)), // Set the desired color for CircularProgressIndicator here
    ),
  );
}
