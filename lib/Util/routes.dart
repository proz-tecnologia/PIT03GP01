import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/cartaopage/cartao_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/salario_extra_page.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';

getRoutes() {
  return {
    HomePage.route: (context) => const HomePage(),
    AjudaPage.route: (context) => const AjudaPage(),
    cartaoPage.route: (context) => const cartaoPage(),
    salarioExtraPage.route: (context) => const salarioExtraPage(),
    SplashPage.route: (context) => const SplashPage(),
  };
}
