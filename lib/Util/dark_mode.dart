import 'package:flutter/material.dart';

class Appcontroller extends ChangeNotifier {
  bool theme = false;

  static Appcontroller instance = Appcontroller();

  changetheme() {
    theme = !theme;

    notifyListeners();
  }
}

class Themechange extends StatefulWidget {
  const Themechange({super.key});

  @override
  State<Themechange> createState() => _ThemechangeState();
}

class _ThemechangeState extends State<Themechange> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Appcontroller.instance.theme,
        onChanged: (value) {
          setState(() {
            Appcontroller.instance.changetheme();
          });
        });
  }
}
