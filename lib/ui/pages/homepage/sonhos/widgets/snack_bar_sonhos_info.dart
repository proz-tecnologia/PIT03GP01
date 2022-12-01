import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

Future<void> snackBarSonhosInfo(BuildContext context) async {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    backgroundColor: const Color(0xfffbf1f1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
    ),
    context: context,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.55,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
          child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: const Color(0xff413d3d),
              label: const Text(
                "Voltar",
                style: TextStyle(
                    color: Color(0xfffbf1f1), fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                color: Color(0xfffbf1f1),
                boxShadow: [
                  BoxShadow(
                      inset: true,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                      color: Colors.black),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 40.0, bottom: 40),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 30,
                                width: 200,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  "Meu Sonho",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: SfLinearGauge(
                                  interval: 0,
                                  minimum: 0,
                                  maximum: 25000,
                                  barPointers: const [
                                    LinearBarPointer(
                                      value: 15000,
                                      color: Color(0xff413d3d),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child: Image.asset(
                              "assets/images/realizar.jpg",
                              height: 120,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Valor do sonho: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Tempo total para realização:  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Tempo restante: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Valor das parcelas mensais: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
