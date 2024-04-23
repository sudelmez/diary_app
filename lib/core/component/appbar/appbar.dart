import 'package:flutter/material.dart';
import '../../base/modules/navigation/navigation_service.dart';
import '../../base/state/base_state.dart';

// ignore: must_be_immutable
class CustomAppbar extends BaseStateless implements PreferredSizeWidget {
  final bool? isBackbutton;
  final String? title;
  final Color? backgroundColor;
  CustomAppbar({
    this.backgroundColor,
    super.key,
    this.isBackbutton,
    this.title,
  });
  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }

  bool onClick = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        systemOverlayStyle: themeData.appBarTheme.systemOverlayStyle,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: title != null ? false : true,
        leading: isBackbutton == true
            ? GestureDetector(
                onTap: () {
                  NavigationService.instance.navigatePop();
                },
                child: Container(
                  color: Colors.transparent,
                  width: size.width,
                  height: size.height,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                    child: Icon(Icons.arrow_back_ios, color: themeData.secondaryHeaderColor),
                  ),
                ),
              )
            : const SizedBox(),
        leadingWidth: isBackbutton == true ? 40 : 160,
        title: title != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title!, style: themeData.textTheme.labelLarge),
              )
            : const SizedBox(),
      ),
    );
  }
}
