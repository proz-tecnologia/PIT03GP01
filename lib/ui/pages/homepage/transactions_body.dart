// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({
    Key? key,
  }) : super(key: key);

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
                  width: 350,
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
                        height: 50,
                        child: GeneralTexts.extrato,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: GeneralTexts.verTudo,
                    ),
                  ],
                ),
              ),
              //herbert implementations

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: Icon(Icons.west, color: Colors.red[300]),
                      title: Text('Netflix',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text(
                        'Setembro',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      trailing: Text(
                        '-R\$ 25,90',
                        style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.east, color: Colors.green),
                      title: Text('Depósito Proz',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text(
                        'Agosto',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      trailing: Text(
                        '+R\$ 1.161,27',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.west, color: Colors.red[300]),
                      title: Text('Amazon',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text(
                        'Agosto',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      trailing: Text(
                        '-R\$ 14,90',
                        style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.east, color: Colors.green),
                      title: Text('Depósito Proz',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text(
                        'Agosto',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      trailing: Text(
                        '+R\$ 1.161,27',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
