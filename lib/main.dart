import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/navigator_key.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';

import 'package:srminhaeiro/ui/pages/login_page/controller/facebook_login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/google_login.controller.dart';
import 'package:srminhaeiro/ui/pages/register_page/controller_register.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';
import 'package:srminhaeiro/util/dark_mode.dart';
import 'package:srminhaeiro/util/routes.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
              ChangeNotifierProvider(create: (_) => CardListController()),
              ChangeNotifierProvider(create: (_) => RegisterController()),
              ChangeNotifierProvider(create: (_) => ExtratoProvider()),
              ChangeNotifierProvider(
                create: (_) => GoogleLoginController(),
              ),
              ChangeNotifierProvider(create: (_) => FacebookLoginController())
            ],
            child: MaterialApp(
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              supportedLocales: const [Locale('pt', 'BR')],
              navigatorKey: navigatorKey,
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
