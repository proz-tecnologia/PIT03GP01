import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/bloc_controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/bloc_state.dart';
import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/gauge.dart';


class Controle extends StatefulWidget {
  static String route = "controle";

  const Controle({Key? key}) : super(key: key);

  @override
  State<Controle> createState() => _ControleState();
}

class _ControleState extends State<Controle> {
  final controller = GaugeController();
  var extrato = 0.0;
  var sonhos =0.0;
  var salarioExtra = 0.0;
  var rendaFixa = 0.0;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Voltar")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          color: const Color(0xff413d3d),
                          child: const Text(
                            'Controle \nFinanceiro',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xfffff9f9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32,),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.square, color: Colors.pink,),
                          Text('Sonhos',),
                          Icon(Icons.square, color: Colors.blueGrey,),
                          Text('Salário Extra'),
                          Icon(Icons.square, color: Colors.blue,),
                          Text('Renda Fixa'),
                          Icon(Icons.square, color: Colors.green,),
                          Text('Extrato',),
                      ],
                      ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.square, color: Colors.white,),
                        //Text('Sonhos'),
                        Icon(Icons.square, color: Colors.white,),
                        //Text('Salário Extra'),
                        Icon(Icons.square, color: Colors.white,),
                       // Text('Renda Fixa'),
                        Icon(Icons.square, color: Colors.white,),
                        //Text('Extrato'),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4,),
                    child: Column(
                      children: [
                        StreamBuilder<GaugeState>(
                          stream: controller.gaugeOut,
                          builder: (context, snapshot){
                            return Gauge(rendaFixa: rendaFixa,
                              sonhos: sonhos,
                              salarioExtra: salarioExtra,extrato: extrato,);
                          },),
                        StreamBuilder(
                          stream: controller.gaugeOut,
                          builder: (context, snapshot) {
                            return Visibility(
                              visible: snapshot.data is GaugeLoading,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),);
                          },),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
