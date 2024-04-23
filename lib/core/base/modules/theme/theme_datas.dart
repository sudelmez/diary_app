import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../util/color_util.dart';

class AppThemeData {
  static AppThemeData? _instance;
  static AppThemeData get instance {
    _instance ??= AppThemeData._init();
    return _instance!;
  }

  double fontSize = 1.0;

  AppThemeData._init();

  ColorUtility colors = ColorUtility();
  ThemeData get lightTheme => ThemeData.light().copyWith(
        // scaffoldBackgroundColor: colors.cardGrey,
        scaffoldBackgroundColor: colors.white,
        hoverColor: colors.spanishRoast, //+ iconlu widget
        primaryColor: colors.darkRift,
        primaryColorLight: colors.white,
        secondaryHeaderColor: const Color.fromRGBO(0, 0, 0, 1), //newscard kenarları
        focusColor: colors.greyCloud, //koyu gri
        cardColor: colors.cardGrey,
        hintColor: colors.greyShingle, //orta gri
        shadowColor: colors.greyCloud, //açık gri
        canvasColor: colors.cardGrey,
        highlightColor: colors.spectrumRed,
        splashColor: colors.greyCloud,
        dividerColor: colors.lightGrey,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        // textTheme: _buildTextTheme("lightTheme"),
      );
  ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: colors.darkRift,
        shadowColor: colors.greyCloud,
        primaryColor: colors.white,
        cardColor: colors.darkRift,
        hoverColor: colors.white,
        primaryColorLight: colors.richBlack, //spanishRoast
        canvasColor: colors.spanishRoast,
        dividerColor: colors.greyShingle,
        splashColor: colors.greyCloud,
        secondaryHeaderColor: colors.white,
        // textTheme: _buildTextTheme("darkTheme"),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      );
  // TextTheme _buildTextTheme(String data) {
  //   return TextTheme(
  //     bodyMedium: data == "lightTheme" ? TextStyleUtility(size: fontSize).blackMedium16 : TextStyleUtility(size: fontSize).whiteMedium16,
  //     bodyLarge: data == "lightTheme" ? TextStyleUtility(size: fontSize).blackSemibold20 : TextStyleUtility(size: fontSize).whiteSemibold20,
  //     titleSmall: data == "lightTheme" ? TextStyleUtility(size: fontSize).whiteSemibold18 : TextStyleUtility(size: fontSize).whiteSemibold18,
  //     headlineLarge: data == "lightTheme" ? TextStyleUtility(size: fontSize).greyRegular14 : TextStyleUtility(size: fontSize).greyRegular14,
  //     titleMedium: data == "lightTheme" ? TextStyleUtility(size: fontSize).greyMedium10 : TextStyleUtility(size: fontSize).greyMedium10,
  //     titleLarge: data == "lightTheme" ? TextStyleUtility(size: fontSize).blackSemibold14 : TextStyleUtility(size: fontSize).whiteSemibold14,
  //     labelSmall: data == "lightTheme" ? TextStyleUtility(size: fontSize).blackSemibold14 : TextStyleUtility(size: fontSize).whiteSemibold14,
  //     displaySmall: data == "lightTheme" ? TextStyleUtility(size: fontSize).greyMedium12 : TextStyleUtility(size: fontSize).greyMedium12,
  //     headlineSmall: data == "lightTheme" ? TextStyleUtility(size: fontSize).blueSemibold30 : TextStyleUtility(size: fontSize).whiteSemibold30,
  //     labelLarge: data == "lightTheme" ? TextStyleUtility(size: fontSize).blueSemibold24 : TextStyleUtility(size: fontSize).whiteSemibold24,
  //     labelMedium: data == "lightTheme" ? TextStyleUtility(size: fontSize).blueMedium16 : TextStyleUtility(size: fontSize).whiteMedium16,
  //     bodySmall: data == "lightTheme" ? TextStyleUtility(size: fontSize).whiteMedium14 : TextStyleUtility(size: fontSize).blueMedium14,
  //     displayLarge: data == "lightTheme" ? TextStyleUtility(size: fontSize).whiteBold20 : TextStyleUtility(size: fontSize).blueBold20,
  //     displayMedium: data == "lightTheme" ? TextStyleUtility(size: fontSize).blueMedium14 : TextStyleUtility(size: fontSize).whiteMedium14,
  //     headlineMedium: data == "lightTheme" ? TextStyleUtility(size: fontSize).whiteSemibold30 : TextStyleUtility(size: fontSize).blueSemibold30,
  //   );
  // }
}