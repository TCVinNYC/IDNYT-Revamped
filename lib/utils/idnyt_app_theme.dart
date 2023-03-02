import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData idnytDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: oraMaterialColor,
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
      color: Color(0xffff0852),
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
    selectedItemColor: Color(0xffff0852),
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
        backgroundColor: const Color(0xffff0852)),
  ),
);

ThemeData idnytLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: oraMaterialColor,
    hintColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Nunito Sans',
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(fontFamily: 'Nunito Sans'),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Nunito Sans',
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Color(0xffff0852),
      backgroundColor: Colors.white,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.indigo,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xffff0852),
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
          backgroundColor: const Color(0xffff0852)),
    ));

MaterialColor oraMaterialColor = const MaterialColor(
  4294903890,
  <int, Color>{
    50: Color.fromRGBO(
      255,
      8,
      82,
      .1,
    ),
    100: Color.fromRGBO(
      255,
      8,
      82,
      .2,
    ),
    200: Color.fromRGBO(
      255,
      8,
      82,
      .3,
    ),
    300: Color.fromRGBO(
      255,
      8,
      82,
      .4,
    ),
    400: Color.fromRGBO(
      255,
      8,
      82,
      .5,
    ),
    500: Color.fromRGBO(
      255,
      8,
      82,
      .6,
    ),
    600: Color.fromRGBO(
      255,
      8,
      82,
      .7,
    ),
    700: Color.fromRGBO(
      255,
      8,
      82,
      .8,
    ),
    800: Color.fromRGBO(
      255,
      8,
      82,
      .9,
    ),
    900: Color.fromRGBO(
      255,
      8,
      82,
      1,
    ),
  },
);
