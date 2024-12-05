import 'package:feed_me/constant/color_constant.dart';
import 'package:feed_me/constant/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemesData {
  static final ThemeData lightTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorConstant.primaryColor,
    hoverColor: Colors.white54,
    useMaterial3: true,
    dividerTheme: const DividerThemeData(color: Colors.grey),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: boldTextStyleGoogle(size: 15, color: ColorConstant.primaryColor),
      iconTheme: const IconThemeData(color: ColorConstant.primaryColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      surfaceTintColor: Colors.transparent,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(primary: ColorConstant.primaryColor),
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
    ),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: ColorConstant.primaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      displayLarge: boldTextStyleGoogle(size: 57),
      displayMedium: semiBoldTextStyleGoogle(size: 45),
      displaySmall: semiBoldTextStyleGoogle(size: 36),
      headlineLarge: semiBoldTextStyleGoogle(size: 32),
      headlineMedium: semiBoldTextStyleGoogle(size: 28),
      headlineSmall: semiBoldTextStyleGoogle(size: 24),
      titleLarge: boldTextStyleGoogle(size: 22),
      titleMedium: boldTextStyleGoogle(size: 16),
      titleSmall: boldTextStyleGoogle(size: 14),
      labelLarge: semiBoldTextStyleGoogle(size: 14),
      labelMedium: semiBoldTextStyleGoogle(size: 12),
      labelSmall: semiBoldTextStyleGoogle(size: 11),
      bodyLarge: primaryTextStyleGoogle(size: 16),
      bodyMedium: primaryTextStyleGoogle(size: 14),
      bodySmall: primaryTextStyleGoogle(size: 12),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      labelPadding: EdgeInsets.zero,
      indicatorColor: ColorConstant.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: semiBoldTextStyleGoogle(size: 14, color: ColorConstant.primaryColor),
      unselectedLabelStyle: semiBoldTextStyleGoogle(size: 13),
      unselectedLabelColor: Colors.grey,
    ),
    listTileTheme: ListTileThemeData(titleTextStyle: boldTextStyleGoogle(size: 16)),
  );
}
