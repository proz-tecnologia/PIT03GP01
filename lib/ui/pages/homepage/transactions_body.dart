// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';
import '../../../models/transacao_model.dart';
import '../../component/item_transaction.dart';

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
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
          child: Container(
            height: 500,
            color: const Color(0xff120c0c),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    color: const Color.fromARGB(255, 253, 250, 250),
                    height: 1,
                    width:  MediaQuery.of(context).size.width*0.9,
                  ),
                ),
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
                        child: GeneralTexts.verTudo,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Consumer<ExtratoProvider>(
                    builder: (context, extratoProvider, child) =>
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) => Dismissible(
                                    key: ValueKey<Transaction>(
                                        extratoProvider
                                            .extratoProvider[index]),
                                    direction: DismissDirection.endToStart,
                                    resizeDuration:
                                    const Duration(milliseconds: 300),
                                    background:
                                    Container(color: Colors.red),
                                    onDismissed: (direction) =>
                                        extratoProvider
                                            .removeByPosition(index),
                                    child: ItemTransaction(
                                      extratoProvider
                                          .extratoProvider[index],
                                      key: ValueKey<int>(index),
                                    ),
                                  ),
                                  itemCount:
                                  extratoProvider.extratoProvider.length)
                            ],
                          ),
                        ),
                  ),
                ),

              ]),
            ),
          ),
        ),
      ),
    );
  }
}
