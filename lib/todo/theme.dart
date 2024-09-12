import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor = Color(0xFFDFECDB);
  static Color primaryDarkColor = Color(0xFF060E1E);
  static Color blackColor = Color(0xFF141922);

  static ThemeData lightTheme =ThemeData(hintColor: Colors.black,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25
      )
    ),
scaffoldBackgroundColor: primaryColor,
    bottomAppBarTheme: BottomAppBarTheme(
     color: Colors.white
  ),
bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white
  )
  );

  static ThemeData darkTheme = ThemeData(hintColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 25
        )
    ),
      scaffoldBackgroundColor: primaryDarkColor,
    bottomAppBarTheme: BottomAppBarTheme(
        color: blackColor
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: blackColor
    )
  );
}