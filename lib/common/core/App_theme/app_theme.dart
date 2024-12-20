import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Nunito",
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: const TextStyle(
    //         fontSize: 18,
    //         color: Colors.white,
    //         fontWeight: FontWeight.w500,
    //         fontFamily: 'Nunito'),
    //     backgroundColor: Colors.blue,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //   ),
    // ),
  );
}
