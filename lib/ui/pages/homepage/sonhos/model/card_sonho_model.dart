class CardSonhoModel {
  final String nomeSonho;
  final double valorTotal;
  final double valorAtual;
  final double adicionarValor;
  final DateTime date;

  CardSonhoModel(
      {required this.nomeSonho,
      required this.valorTotal,
      required this.valorAtual,
      required this.adicionarValor,
      required this.date});
}
