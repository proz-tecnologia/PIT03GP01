import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/controle_financeiro.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/criar_sonho_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/meus_sonhos_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/sonhos.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/cartaopage/cartao_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/conta_menu_page/conta_menu.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/criargrupo_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/salario_extra_page.dart';
import 'package:srminhaeiro/ui/splash/pages/splash_page.dart';
import '../ui/pages/homepage/entradas/transaction_entrada.dart';
import '../ui/pages/homepage/saidas/transaction_saida.dart';
import '../ui/pages/menu_page/pages/profile/pages/dados_page.dart';
import '../ui/pages/menu_page/pages/profile/pages/notificacoes.dart';
import '../ui/pages/menu_page/pages/profile/pages/privacidade.dart';
import '../ui/pages/menu_page/pages/profile/profile_page.dart';

getRoutes() {
  return {
    HomePage.route: (context) => const HomePage(),
    AjudaPage.route: (context) => const AjudaPage(),
    CartaoPage.route: (context) => const CartaoPage(),
    ContaPage.route: (context) => const ContaPage(),
    SalarioExtraPage.route: (context) => const SalarioExtraPage(),
    SplashPage.route: (context) => const SplashPage(),
    ProfilePage.route: (context) => ProfilePage(),
    EntradasTransaction.route: (context) => const EntradasTransaction(),
    SaidasTransaction.route: (context) => const SaidasTransaction(),
    Controle.route: (context) => const Controle(),
    Sonhos.route: (context) => const Sonhos(),
    Notificacoes.route: (context) => const Notificacoes(),
    Dados.route: (context) => const Dados(),
    Privacidade.route: (context) => const Privacidade(),
    GroupCreate.route: (context) => const GroupCreate(),
    LoginPage.route: (context) => const LoginPage(),
    Onboarding.route: (context) => const Onboarding(),
    LoginPageTwo.route: (context) => const LoginPageTwo(),
    DreamCreate.route: (context) => const DreamCreate(),
    MeusSonhosPage.route: (context) => const MeusSonhosPage(),
  };
}
