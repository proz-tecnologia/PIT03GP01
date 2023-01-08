import 'package:flutter/material.dart';
import 'package:srminhaeiro/navigator_key.dart';

class AlertDialogComponent {
  show(
      {required String title,
      required String message,
      String? positiveText,
      String? negativeText,
      VoidCallback? positiveAction,
      VoidCallback? negativeAction}) {
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (positiveAction != null) positiveAction();
                      navigatorKey.currentState!.pop();
                    },
                    child: Text(positiveText ?? "Sim")),
                TextButton(
                    onPressed: () {
                      if (negativeAction != null) negativeAction();
                      navigatorKey.currentState!.pop();
                    },
                    child: Text(negativeText ?? "Não"))
              ],
            ));
  }

  showInfo(
      {required String title,
      required String message,
      String? actionText,
      VoidCallback? action}) {
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      if (action != null) action();
                      navigatorKey.currentState!.pop();
                    },
                    child: Text(actionText ?? "Entendi")),
              ],
            ));
  }
}
