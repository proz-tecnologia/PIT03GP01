import 'package:flutter/material.dart';
import 'package:srminhaeiro/pages/general_pages/Appbar.dart';
import 'package:srminhaeiro/widgets/themeChange.dart';

import 'pages/general_pages/generalPagesBody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Appcontroller.instance,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: Appcontroller.instance.theme
                    ? Brightness.dark
                    : Brightness.light),
            home: const MyHomePage(),
          );
        });
  }
}
