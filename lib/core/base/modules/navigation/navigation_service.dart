import 'package:diary_app/core/base/modules/navigation/base_navigation.dart';
import 'package:flutter/material.dart';

class NavigationService implements BaseNavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  removeOldRoutes() => (Route<dynamic> route) => false;

  @override
  Future navigateToPage({required String path, Object? arguments}) async {
    return await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  @override
  Future<void> navigatePop<T extends Object?>({T? res}) async {
    return navigatorKey.currentState!.pop<T>(res);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeOldRoutes(), arguments: arguments);
  }

  @override
  Future<void> navigatePopUntil({required int viewCount}) async {
    int count = viewCount;
    navigatorKey.currentState!.popUntil((_) => count-- <= 0);
  }
}