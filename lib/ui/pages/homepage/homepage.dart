import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/appbar_config/appbar.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_list.dart';
import 'package:srminhaeiro/ui/pages/homepage/transactions_body.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/balance_value.dart';

import 'package:srminhaeiro/ui/pages/menu_page/floating_menu.dart';

class HomePage extends StatelessWidget {
  static String route = "inicial";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      floatingActionButton: buildMenuButton(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          AppBarSliver(),
          BalanceValue(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          ButtonList(),
          TransactionBody(),
        ],
      ),
    );
  }
}
