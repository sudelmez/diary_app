import 'package:flutter/material.dart';

import 'theme_datas.dart';

class AppTheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  AppTheme._init();

  ThemeData get theme => AppThemeData.instance.darkTheme;
}

class TextSize {
  static TextSize? _instance;
  static TextSize get instance {
    _instance ??= TextSize._init();
    return _instance!;
  }

  TextSize._init();

  double get size => 1;
}
