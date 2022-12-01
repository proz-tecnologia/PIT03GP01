
class GaugeState{
  double sonhos;
  double salarioExtra;
  double rendaFixa;
  double extrato;

  GaugeState({required this.salarioExtra, required this.rendaFixa, required this.sonhos, required this.extrato});
}

class GaugeLoading extends GaugeState{
  GaugeLoading() : super(salarioExtra: 0.0, sonhos: 0.0, rendaFixa: 0.0, extrato: 0.0);
}