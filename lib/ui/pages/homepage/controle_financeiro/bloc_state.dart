
class GaugeState{
  double sonhos;
  double salarioExtra;
  double rendaFixa;

  GaugeState({required this.salarioExtra, required this.rendaFixa, required this.sonhos});
}

class GaugeLoading extends GaugeState{
  GaugeLoading() : super(salarioExtra: 0.0, sonhos: 0.0, rendaFixa: 0.0);
}