import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/cartaopage/cartao_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/salario_extra_page.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';
import '../ui/pages/homepage/entradas/extrato_entradas.dart';
import '../ui/pages/homepage/saidas/saidas_extrato.dart';
import '../ui/pages/homepage/sonhos/sonhos.dart';

getRoutes() {
  return {
    HomePage.route: (context) => const HomePage(),
    AjudaPage.route: (context) => const AjudaPage(),
    CartaoPage.route: (context) => const CartaoPage(),
    SalarioExtraPage.route: (context) => const SalarioExtraPage(),
    SplashPage.route: (context) => const SplashPage(),
  };
}
