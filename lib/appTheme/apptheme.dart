import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData appThemeData = ThemeData(
      fontFamily: 'Nunito',
      scaffoldBackgroundColor: Colors.cyan[100],
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan.shade600,
          shadowColor: Color.fromARGB(155, 0, 0, 0)),
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromARGB(148, 3, 168, 244).withOpacity(0.3),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2.0,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, foregroundColor: Colors.white)));

  static CupertinoThemeData iosThemeData = const CupertinoThemeData(
    scaffoldBackgroundColor: Colors.white,
    barBackgroundColor: Color.fromARGB(175, 97, 203, 253),
    primaryColor: Color.fromARGB(146, 217, 243, 255),
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: Colors.lightBlue, fontFamily: 'Nunito'),
    ),
  );
}
