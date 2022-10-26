import 'package:srminhaeiro/ui/pages/homepage/appbar_config/profile_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/controle_financeiro.dart';
import 'package:srminhaeiro/ui/pages/homepage/entradas/extrato_entradas.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/homepage/saidas/saidas_extrato.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/sonhos.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/cartaopage/cartao_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/salario_extra_page.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';

getRoutes() {
  return {
    HomePage.route: (context) => const HomePage(),
    AjudaPage.route: (context) => const AjudaPage(),
    CartaoPage.route: (context) => const CartaoPage(),
    SalarioExtraPage.route: (context) => const SalarioExtraPage(),
    SplashPage.route: (context) => const SplashPage(),
    ProfilePage.route: (context) => const ProfilePage(),
    ExtratoEntradas.route: (context) => const ExtratoEntradas(),
    ExtratoSaidas.route: (context) => const ExtratoSaidas(),
    Controle.route: (context) => const Controle(),
    Sonhos.route: (context) => const Sonhos(),
  };
}
