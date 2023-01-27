import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/appbar_config/appbar.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';

import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_list.dart';
import 'package:srminhaeiro/ui/pages/homepage/transactions_body.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/balance_value.dart';
import 'package:srminhaeiro/ui/pages/menu_page/floating_menu.dart';

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
      backgroundColor: const Color.fromARGB(255, 253, 250, 250),
      floatingActionButton: buildMenuButton(context),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 234, 230, 230),
              Color.fromARGB(255, 244, 242, 242),
              Color.fromARGB(255, 231, 225, 225),
              Color.fromARGB(255, 224, 220, 220),
              Color.fromARGB(255, 192, 178, 178),
              Color.fromARGB(255, 165, 151, 151),
            ],
          )),
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
