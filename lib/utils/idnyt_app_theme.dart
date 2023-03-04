import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData idnytLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: idnytMaterialColor,
    hintColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Nunito Sans',
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(fontFamily: 'Nunito Sans'),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Nunito Sans',
        // color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Color.fromARGB(255, 27, 39, 90),
      backgroundColor: Colors.white,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.indigo,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 27, 39, 90),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 27, 39, 90)),
    ));

ThemeData idnytDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: idnytMaterialColor,
  primaryColor: const Color(0xff1b275a),
  scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
  hintColor: Colors.grey[600],
  fontFamily: 'Nunito Sans',
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(fontFamily: 'Nunito Sans'),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito Sans',
      // color: Color(0xffff0852),
    ),
    backgroundColor: Color.fromARGB(255, 24, 24, 24),
    surfaceTintColor: Color.fromARGB(255, 24, 24, 24),
    foregroundColor: Color(0xff1b275a),
    elevation: 1,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color.fromARGB(255, 35, 36, 37),
    selectedItemColor: Color.fromARGB(255, 27, 39, 90),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: const Color(0xff1b275a),
    scrimColor: Colors.white.withOpacity(0.1),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    displayMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 148, 151, 155),
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color(0xff1b275a),
    ),
  ),
  cardColor: Colors.grey[900],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 27, 39, 90)),
  ),
);

MaterialColor idnytMaterialColor = const MaterialColor(
  0xffef9b00,
  <int, Color>{
    50: Color(0xfffdf7e1),
    100: Color(0xfff9eab2),
    200: Color(0xfff6dc81),
    300: Color(0xfff2d04f),
    400: Color(0xfff1c429),
    500: Color(0xffefbb0e),
    600: Color(0xffefad04),
    700: Color(0xffef9b00),
    800: Color(0xffee8b00),
    900: Color(0xffee6d00),
  },
);
