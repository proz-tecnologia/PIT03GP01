import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/appbar_config/appbar.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/extrato_list.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_list.dart';
import 'package:srminhaeiro/ui/pages/homepage/transactions_body.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/balance_value.dart';
import 'package:srminhaeiro/ui/pages/menu_page/floating_menu.dart';
import '../../../models/extrato.dart';
import '../../../repositories/input_repository.dart';
import '../../../repositories/output_repository.dart';

class HomePage extends StatefulWidget {
  static String route = "inicial";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final InputRepository inputRepository = InputRepository();
  final OutputRepository outputRepository = OutputRepository();


  List<Extrato> inputs = [];
  Extrato? deleteInput;
  int? deleteInputPosition;
  String? errorInputText;

  List<Extrato> outputs = [];
  Extrato? deleteOutput;
  int? deleteOutPosition;
  String? errorOutputText;

  @override
  void initState(){
    super.initState();
    inputRepository.getInputList().then((value){
      setState(() {
        inputs = value;
      });
    });
    outputRepository.getOutputList().then((value){
      setState(() {
        outputs = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      floatingActionButton: buildMenuButton(context),
      body: const CustomScrollView(
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
