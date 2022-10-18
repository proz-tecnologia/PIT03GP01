import 'package:flutter/material.dart';
import 'package:srminhaeiro/Util/darkMode.dart';
import 'package:srminhaeiro/Util/routes.dart';

import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/initialPageBar.dart';

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
            title: 'SR. M I N H A E I R O',
            debugShowCheckedModeBanner: false,
            /* theme: ThemeData(
                brightness: Appcontroller.instance.theme
                    ? Brightness.dark
                    : Brightness.light), */
            initialRoute: InicialPage.route,
            routes: getRoutes(),
          );
        });
  }
}
