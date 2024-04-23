import 'package:flutter/material.dart';

import '../util/color_util.dart';
import '../util/padding_util.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
  Size get size => MediaQuery.of(context).size;
  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;
  double get appBarSize => topPadding + kToolbarHeight;
  double dynamicHeight(double value) => (height * value);
  double dynamicWidth(double value) => width - value;
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);
  final ColorUtility colors = ColorUtility();
  final PaddingUtility paddings = PaddingUtility();
}

abstract class BaseStateless extends StatelessWidget {
  BaseStateless({Key? key}) : super(key: key);
  ThemeData themeData(BuildContext context) => Theme.of(context);
  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  Size size(BuildContext context) => MediaQuery.of(context).size;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
  double appBarSize(BuildContext context) =>
      topPadding(context) + kToolbarHeight;
  double dynamicHeight(BuildContext context, double value) =>
      (height(context) * value);
  double dynamicWidth(BuildContext context, double value) =>
      width(context) - value;

  final ColorUtility colors = ColorUtility();
  final PaddingUtility paddings = PaddingUtility();
}