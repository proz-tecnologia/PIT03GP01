import 'package:flutter/material.dart';
import 'package:srminhaeiro/navigator_key.dart';

class ProgressDialogComponent {
  bool _isShowing = false;

  show(String message) {
    if (_isShowing) return;
    _isShowing = true;
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
              backgroundColor: Colors.black,
              content: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ));
  }

  hide() {
    if (!_isShowing) return;
    _isShowing = false;
    navigatorKey.currentState!.pop();
  }
}
