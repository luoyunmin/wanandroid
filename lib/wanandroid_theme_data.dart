import 'package:flutter/material.dart';

class WanAndroidThemeData {
  static ThemeData lightThemeData = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
    // tabBarTheme: const TabBarTheme(
    //   dividerColor: Colors.transparent,
    //   unselectedLabelColor: Colors.white, //未选中颜色
    //   labelColor: Colors.white,
    // ),
    // bottomAppBarTheme: const BottomAppBarTheme(
    //   color: Colors.transparent,
    //   surfaceTintColor: Colors.blue,
    // ), // 选中颜色
  );

  static ThemeData darkThemeData = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
    // tabBarTheme: const TabBarTheme(
    //   dividerColor: Colors.transparent,
    //   unselectedLabelColor: Colors.white, //未选中颜色
    //   labelColor: Colors.white,
    // ),
    // bottomAppBarTheme: const BottomAppBarTheme(
    //   color: Colors.transparent,
    //   surfaceTintColor: Colors.blue,
    // ), // 选中颜色
  );
}
