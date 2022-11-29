
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';
import 'package:srminhaeiro/util/dark_mode.dart';
import 'package:srminhaeiro/util/routes.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';


void main() {
  runApp( ChangeNotifierProvider(
      create: (context)=> ExtratoProvider(),
      child: const MyApp()));
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
            initialRoute: SplashPage.route,
            routes: getRoutes(),
          );
        });
  }
}
