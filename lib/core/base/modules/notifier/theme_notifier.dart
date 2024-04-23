// import 'package:flutter/material.dart';

// class ThemeNotifier extends ChangeNotifier {
//   ThemeData _currentTheme = AppTheme.instance.theme;
//   ThemeData currentTheme() {
//     loadTheme();
//     return _currentTheme;
//   }

//   double _currentSize = TextSize.instance.size;
//   double get currentSize => _currentSize;
//   TextSizes _themeSize = TextSizes.medium;
//   TextSizes get themeSize => _themeSize;

//   static const String _themeKey = 'app_theme';
//   static const String _sizeKey = 'text_size';

//   Future<void> loadTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final storedTheme = prefs.getString(_themeKey);
//     final storedSize = prefs.getString(_sizeKey);
//     if (storedSize != null) {
//       if (storedSize == 'small') {
//         _themeSize = TextSizes.small;
//         _currentSize = 0.9;
//       } else if (storedSize == 'medium') {
//         _themeSize = TextSizes.medium;
//         _currentSize = 1;
//       } else if (storedSize == 'large') {
//         _themeSize = TextSizes.large;
//         _currentSize = 1.1;
//       }
//       AppThemeData.instance.fontSize = currentSize;
//     }
//     _currentTheme = (storedTheme == 'light') ? AppThemeData.instance.lightTheme : AppThemeData.instance.darkTheme;
//     notifyListeners();
//   }

//   Future<void> changeAppTheme(AppThemes theme) async {
//     if (theme == AppThemes.light) {
//       _currentTheme = AppThemeData.instance.lightTheme;
//     } else {
//       _currentTheme = AppThemeData.instance.darkTheme;
//     }
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(_themeKey, theme.toString().split('.').last);
//     notifyListeners();
//   }

//   Future<void> changeTextSize(TextSizes size) async {
//     if (size == TextSizes.small) {
//       _currentSize = 0.9;
//     } else if (size == TextSizes.medium) {
//       _currentSize = 1;
//     } else if (size == TextSizes.large) {
//       _currentSize = 1.1;
//     }
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(_sizeKey, size.toString().split('.').last);
//     loadTheme();
//     notifyListeners();
//   }
// }

// enum AppThemes { light, dark }

// enum TextSizes { small, medium, large }