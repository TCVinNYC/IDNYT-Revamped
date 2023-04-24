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
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 12,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.deepOrangeAccent,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0.5,
    shadowColor: Colors.grey[600],
    titleTextStyle: const TextStyle(
      fontFamily: 'Nunito Sans',
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    foregroundColor: const Color.fromARGB(255, 27, 39, 90),
    backgroundColor: Colors.amber,
    centerTitle: false,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    enableFeedback: true,
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.indigo,
  ),
  indicatorColor: Colors.deepOrange,
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromARGB(255, 27, 39, 90),
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    textStyle: TextStyle(
      fontSize: 12,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
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
      backgroundColor: const Color(0xffef9b00),
    ),
  ),
);

ThemeData idnytDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: idnytMaterialColor,
  primaryColor: const Color(0xff1b275a),
  scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
  hintColor: Colors.grey[600],
  fontFamily: 'Nunito Sans',
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.deepOrangeAccent,
      ),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(fontFamily: 'Nunito Sans'),
      closeIconColor: Colors.red,
      actionTextColor: Colors.grey,
      backgroundColor: Color.fromARGB(255, 35, 36, 37)),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito Sans',
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color.fromARGB(255, 24, 24, 24),
    foregroundColor: Colors.white,
    elevation: 1,
    centerTitle: false,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    enableFeedback: true,
    backgroundColor: Color.fromARGB(255, 37, 47, 95),
    foregroundColor: Colors.white,
  ),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 35, 36, 37),
      selectedItemColor: Colors.white),
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
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  ),
  cardColor: Colors.grey[900],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 27, 39, 90),
        shadowColor: Colors.grey[800]),
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
