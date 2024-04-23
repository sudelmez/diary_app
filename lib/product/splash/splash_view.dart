import 'package:flutter/material.dart';

import '../../core/base/modules/navigation/navigation_paths.dart';
import '../../core/base/modules/navigation/navigation_service.dart';
import '../../core/base/state/base_state.dart';
import '../../core/base/view/base_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => NavigationService.instance.navigateToPageClear(path: NavigationPaths.home));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseView(
      body: Center(child: Icon(Icons.star)),
    );
  }
}
