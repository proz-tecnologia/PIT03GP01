import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';

import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/dropdown.years.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/sonhos.dart';

import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';
import 'package:srminhaeiro/util/dark_mode.dart';
import 'package:srminhaeiro/util/routes.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => DropdownYearscontroller()),
              ChangeNotifierProvider(create: (_) => CardListController()),
              ChangeNotifierProvider(create: (_) => ExtratoProvider()),
            ],
            child: MaterialApp(
              title: 'SR. M I N H A E I R O',
              debugShowCheckedModeBanner: false,

              /* theme: ThemeData(
                  brightness: Appcontroller.instance.theme
                      ? Brightness.dark
                      : Brightness.light), */
              initialRoute: SplashPage.route,
              routes: getRoutes(),
            ),
          );
        });
  }
}
