import 'package:diary_app/core/base/modules/navigation/navigation_paths.dart';
import 'package:flutter/material.dart';
import '../../base/modules/navigation/navigation_service.dart';
import '../../base/state/base_state.dart';

// ignore: must_be_immutable
class CustomAppbar extends BaseStateless implements PreferredSizeWidget {
  final bool? isBackbutton;
  final String? title;
  final bool? isNote;
  final bool? isDelete;
  final Color? backgroundColor;
  final Function()? onPressDel;
  CustomAppbar({
    this.onPressDel,
    this.isDelete,
    this.isNote,
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
                    child: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                ),
              )
            : const SizedBox(),
        leadingWidth: isBackbutton == true ? 40 : 160,
        title: title != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24)),
              )
            : const SizedBox(),
        actions: [
          isNote == true
              ? IconButton(
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationPaths.writeNote);
                  },
                  icon: const Icon(Icons.edit_note_sharp, size: 30))
              : const SizedBox(),
          isDelete == true ? IconButton(onPressed: onPressDel, icon: const Icon(Icons.delete_forever, size: 30)) : const SizedBox()
        ],
      ),
    );
  }
}
