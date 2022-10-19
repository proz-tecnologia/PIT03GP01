import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/initialPageBar.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/ajuda.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/cartaoPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/salarioExtraPage.dart';

getRoutes() {
  return {
    InicialPage.route: (context) => const InicialPage(),
    AjudaPage.route: (context) => const AjudaPage(),
    cartaoPage.route: (context) => const cartaoPage(),
    salarioExtraPage.route: (context) => const salarioExtraPage(),
  };
}
