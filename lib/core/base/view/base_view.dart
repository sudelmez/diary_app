import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../component/appbar/appbar.dart';
import '../state/base_state.dart';

class BaseView extends StatefulWidget {
  final CustomAppbar? appBar;
  final bool? isLoading;
  final Widget? body;
  final Widget? floatingActionButton;
  final Color? scaffoldBackgroundColor;
  final bool? isbottomNavigationBar;
  final int? index;
  final bool imageBackground;
  final String? imageUrl;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  const BaseView({
    this.imageBackground = false,
    this.imageUrl,
    this.index,
    super.key,
    this.appBar,
    this.isbottomNavigationBar = false,
    this.isLoading,
    this.body,
    this.floatingActionButton,
    this.scaffoldBackgroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
  });

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends BaseState<BaseView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: widget.scaffoldBackgroundColor ?? Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScaffoldWidget(widget.scaffoldBackgroundColor);
  }

  Scaffold ScaffoldWidget(Color? color) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      extendBodyBehindAppBar: widget.imageBackground,
      appBar: widget.appBar,
      backgroundColor: color,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: widget.floatingActionButton,
      body: (widget.isLoading == true) ? const Center(child: CupertinoActivityIndicator()) : widget.body ?? const SizedBox(),
    );
  }
}
