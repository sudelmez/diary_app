import 'package:flutter/material.dart';

class AlertManager {
  static AlertManager? _instance;
  static AlertManager get instance {
    _instance ??= AlertManager._init();
    return _instance!;
  }

  AlertManager._init();

  final GlobalKey<ScaffoldMessengerState> alertKey = GlobalKey<ScaffoldMessengerState>();

  void showSnack(SnackType type, {String? message}) {
    SnackBar snackBar = SnackBar(
      content: Text(message ?? type.message),
      backgroundColor: type.color,
    );
    alertKey.currentState?.showSnackBar(snackBar);
  }

  showAlert<T extends Object?>(Widget child, BuildContext context, {Future<void> Function(T? value)? onClose, bool barrierDismissible = false}) {
    showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return child;
      },
    ).then((T? value) async {
      if (onClose != null) await onClose(value);
    });
  }
}

enum SnackType {
  error(Color(0xffF7444E), "HATA"),
  warning(Color(0xffFD9D42), "UYARI"),
  success(Color(0xff328048), "BAŞARILI");

  final Color color;
  final String message;
  const SnackType(this.color, this.message);
}
