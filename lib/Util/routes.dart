import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/homePage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/AjudaPage/ajudaPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/cartaoPage/cartaoPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/salarioExtraPage/salarioExtraPage.dart';

getRoutes() {
  return {
    HomePage.route: (context) => const HomePage(),
    AjudaPage.route: (context) => const AjudaPage(),
    cartaoPage.route: (context) => const cartaoPage(),
    salarioExtraPage.route: (context) => const salarioExtraPage(),
  };
}
