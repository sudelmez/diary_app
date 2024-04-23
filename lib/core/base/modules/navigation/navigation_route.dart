import 'package:diary_app/product/home/home_view.dart';
import 'package:diary_app/product/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'navigation_paths.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route generateRoute(RouteSettings args, {Uri? url}) {
    switch (args.name) {
      case NavigationPaths.splash:
        return normalNavigate(const SplashView());
      case NavigationPaths.home:
        return normalNavigate(const HomeView());
      default:
        return normalNavigate(const SplashView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
