import 'package:flutter/material.dart';
import 'package:srminhaeiro/extensions/extension_double.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:provider/provider.dart';

class Gauge extends StatelessWidget {
  final double incomingValue;
  final double outcomingValue;
  final double sonhos;
  final double rendaFixa;
  final double salarioExtra;
  final double extrato;

  const Gauge(
      {Key? key,
      required this.rendaFixa,
      required this.salarioExtra,
      required this.sonhos,
      required this.extrato,
      required this.incomingValue,
      required this.outcomingValue})
      : super(key: key);

  double get total => incomingValue - outcomingValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExtratoProvider>(
      builder: (context, extratoProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const Text(
            'R\$ 850,55',
            style: TextStyle(fontSize: 16),
          ),
          SfLinearGauge(
            showTicks: false,
            showAxisTrack: false,
            showLabels: false,
            minimum: 0.0,
            maximum: 1500.90,
            axisLabelStyle: const TextStyle(),
            barPointers: const [
              LinearBarPointer(
                value: 850.55,
                color: Colors.pink,
                edgeStyle: LinearEdgeStyle.bothCurve,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'R\$ 350,55',
            style: TextStyle(fontSize: 16),
          ),
          SfLinearGauge(
            showTicks: false,
            showAxisTrack: false,
            showLabels: false,
            minimum: 0.0,
            maximum: 1500.90,
            barPointers: const [
              LinearBarPointer(
                value: 350.55,
                color: Colors.blueGrey,
                edgeStyle: LinearEdgeStyle.bothCurve,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'R\$ 150,55',
            style: TextStyle(fontSize: 16),
          ),
          SfLinearGauge(
            showTicks: false,
            showAxisTrack: false,
            showLabels: false,
            minimum: 0.0,
            maximum: 1500.90,
            barPointers: const [
              LinearBarPointer(
                value: 150.55,
                color: Colors.lightBlue,
                edgeStyle: LinearEdgeStyle.bothCurve,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            (extratoProvider.getTotalIncoming -
                    extratoProvider.getTotalOutcoming)
                .formatBRL,
            style: const TextStyle(fontSize: 16),
          ),
          SfLinearGauge(
            showTicks: false,
            showAxisTrack: false,
            showLabels: false,
            minimum: 0.0,
            maximum: extratoProvider.getTotalIncoming -
                extratoProvider.getTotalOutcoming,
            barPointers:  [
              LinearBarPointer(
                color: Colors.green,
                value: extratoProvider.getTotalIncoming -
                    extratoProvider.getTotalOutcoming,
                edgeStyle: LinearEdgeStyle.bothCurve,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
