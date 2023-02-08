// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/conta_menu_page/conta_extrato.page.dart';

import '../../../models/transacao_model.dart';
import '../../components/item_transaction.dart';

class TransactionBody extends StatefulWidget {
  const TransactionBody({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionBody> createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            Container(
              color: Colors.grey[300],
              height: MediaQuery.of(context).size.height * 0.7,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(650, 150),
                topRight: Radius.elliptical(125, 0),
                bottomLeft: Radius.elliptical(200, 0),
                bottomRight: Radius.elliptical(1000, 450),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                color: const Color.fromARGB(255, 51, 49, 49),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FractionallyAlignedSizedBox(
                    heightFactor: 0.8,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SizedBox(
                                width: 100,
                                child: GeneralTexts.extrato,
                              ),
                            ),
                            SizedBox(
                                width: 80,
                                child: TextButton(
                                  child: GeneralTexts.verTudo,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ContaPage.route);
                                  },
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: const Color.fromARGB(255, 253, 250, 250),
                          thickness: 0.4,
                        ),
                      ),
                      Consumer<ExtratoProvider>(
                        builder: (context, extratoProvider, child) => Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (_, index) => Dismissible(
                                    key: ValueKey<Transaction>(
                                        extratoProvider.extratoProvider[index]),
                                    direction: DismissDirection.endToStart,
                                    resizeDuration:
                                        const Duration(milliseconds: 300),
                                    background: Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      color: Colors.redAccent,
                                      child: Icon(Icons.delete_forever),
                                    ),
                                    onDismissed: (direction) =>
                                        extratoProvider.removeByPosition(index),
                                    child: ItemTransaction(
                                      extratoProvider.extratoProvider[index],
                                      key: ValueKey<int>(index),
                                    ),
                                  ),
                              itemCount:
                                  extratoProvider.extratoProvider.length),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
