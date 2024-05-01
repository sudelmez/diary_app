import 'package:diary_app/core/modules/note_pad/note.dart';
import 'package:diary_app/product/home/home_view.dart';
import 'package:diary_app/product/note_detail/note_detail_view.dart';
import 'package:diary_app/product/splash/splash_view.dart';
import 'package:diary_app/product/write_note/write_note.dart';
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
      case NavigationPaths.writeNote:
        Map<String, dynamic>? arguments = args.arguments as Map<String, dynamic>?;
        Note? note = arguments?["note"];
        return normalNavigate(WriteNote(note: note));
      case NavigationPaths.noteDetail:
        Map<String, dynamic> arguments = args.arguments as Map<String, dynamic>;
        Note note = arguments["note"];
        return normalNavigate(NoteDetail(note: note));
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
