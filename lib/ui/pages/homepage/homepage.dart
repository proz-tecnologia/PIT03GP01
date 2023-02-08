import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/appbar_config/appbar.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_list.dart';
import 'package:srminhaeiro/ui/pages/homepage/transactions_body.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/balance_value.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/google_login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/conta_menu_page/conta_extrato.page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/profile/pages/dados_page.dart';

class HomePage extends StatefulWidget {
  static String route = "inicial";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool visible = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<CardListController>().cloudFirestoreGetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 209, 209),
      floatingActionButton: SpeedDial(
        spacing: 16,
        visible: true,
        spaceBetweenChildren: 16,
        foregroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(25, 50),
            // topRight: Radius.elliptical(60, 20),
            bottomLeft: Radius.elliptical(25, 50),
            bottomRight: Radius.elliptical(25, 50),
          ),
        ),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        activeBackgroundColor: const Color.fromARGB(255, 211, 209, 209),
        label: const Text("Menu"),
        backgroundColor: const Color.fromARGB(255, 211, 209, 209),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              elevation: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(25, 50),
                  // topRight: Radius.elliptical(60, 20),
                  bottomLeft: Radius.elliptical(25, 50),
                  bottomRight: Radius.elliptical(25, 50),
                ),
              ),
              onTap: () {
                final provider =
                    Provider.of<GoogleLoginController>(context, listen: false);
                provider.googleLogout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
              },
              label: "Sair do APP",
              child: const Icon(Icons.logout)),
          SpeedDialChild(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(25, 50),
                  // topRight: Radius.elliptical(60, 20),
                  bottomLeft: Radius.elliptical(25, 50),
                  bottomRight: Radius.elliptical(25, 50),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, AjudaPage.route);
              },
              label: "Preciso de ajuda",
              child: const Icon(Icons.live_help_outlined)),
          SpeedDialChild(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(25, 50),
                  // topRight: Radius.elliptical(60, 20),
                  bottomLeft: Radius.elliptical(25, 50),
                  bottomRight: Radius.elliptical(25, 50),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, Dados.route);
              },
              label: "Dados do usuário",
              child: const Icon(Icons.person)),
          SpeedDialChild(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(25, 50),
                  // topRight: Radius.elliptical(60, 20),
                  bottomLeft: Radius.elliptical(25, 50),
                  bottomRight: Radius.elliptical(25, 50),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, ContaPage.route);
              },
              label: "Conta",
              child: const Icon(Icons.attach_money_outlined)),
        ],
      ),
      //buildMenuButton(context),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 230, 230, 233),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 8,
                ),
              ),
              AppBarSliver(
                onTapVisibility: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                isVisible: visible,
              ),
              BalanceValue(
                isVisible: visible,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              const ButtonList(),
              const TransactionBody(),
            ],
          ),
        ),
      ),
    );
  }
}
