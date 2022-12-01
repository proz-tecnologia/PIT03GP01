import 'dart:async';
import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/bloc_state.dart';

class GaugeController {
  final gaugeController = StreamController<GaugeState>.broadcast()..add(GaugeState(
      salarioExtra: 0.0, rendaFixa: 0.0, sonhos: 0.0, extrato: 0.0));

  Stream<GaugeState> get gaugeOut => gaugeController.stream;

  Future<void> gaugeLoad(
      {required double sonhos,
      required double salarioExtra,
      required double rendaFixa,
      required double extrato}) async {
    gaugeController.add(GaugeLoading());
    await Future.delayed(const Duration(seconds: 1));
    gaugeController.add(GaugeState(
        salarioExtra: salarioExtra, rendaFixa: rendaFixa, sonhos: sonhos, extrato:extrato));
  }

  void dispose() {
    gaugeController.close();
  }
}
