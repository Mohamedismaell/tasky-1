import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constants/app_sizes.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFF3A4640),
  ),
  scaffoldBackgroundColor: Color(0xFFF6F7F9),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    titleTextStyle: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xFF161F1B),
    ),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return 0;
      }
      return 2;
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF15B86C),
        foregroundColor: Color(0xFFFFFCFC),
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: Size.fromHeight(AppSizes.h40)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFCFC),
    extendedTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontSize: 24.sp,
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 32.sp,
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: Color(0xFF3A4640),
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: Color(0xFF6A6A6A),
      fontSize: 16.sp,
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xFF49454F),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF161F1B),
      fontSize: 20.sp,
    ),
    labelMedium: TextStyle(color: Colors.black, fontSize: 16.sp),
    labelLarge: TextStyle(color: Colors.black, fontSize: 24.sp),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xFF9E9E9E),
    ),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    focusColor: Color(0xFFD1DAD6),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Color(0xFFD1DAD6),
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Color(0xFFD1DAD6),
        width: 0.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Color(0xFFD1DAD6),
        width: 0.5,
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(
      color: Color(0xFFD1DAD6),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF161F1B),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: DividerThemeData(color: Color(0xFFD1DAD6)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.white,
    selectionHandleColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF6F7F9),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Color(0xFF3A4640),
    selectedItemColor: Color(0xFF14A662),
  ),
  splashFactory: NoSplash.splashFactory,
  popupMenuTheme: PopupMenuThemeData(
    color: Color(0xFFF6F7F9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    shadowColor: Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  ),
);
