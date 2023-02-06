class CardSonhoModel {
  String? uid;
  final String nomeSonho;
  final double valorTotal;
  final double valorAtual;
  late double adicionarValor;
  final DateTime date;
  final DateTime date2;

  CardSonhoModel(
      {this.uid,
      required this.nomeSonho,
      required this.valorTotal,
      required this.valorAtual,
      required this.adicionarValor,
      required this.date,
      required this.date2});

  CardSonhoModel copyWith(
      String? newnomeSonho,
      double? newvalorTotal,
      double? newvalorAtual,
      double? newadicionarValor,
      DateTime? newdate,
      DateTime? newdate2) {
    return CardSonhoModel(
        nomeSonho: newnomeSonho ?? nomeSonho,
        valorTotal: newvalorTotal ?? valorTotal,
        valorAtual: newvalorAtual ?? valorAtual,
        adicionarValor: newadicionarValor ?? adicionarValor,
        date: newdate ?? date,
        date2: newdate2 ?? date2);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome_sonho': nomeSonho,
      'valor_total': valorTotal,
      'valor_atual': valorAtual,
      'adicionar_valor': adicionarValor,
      'date_iniciar': date.millisecondsSinceEpoch,
      'date_realizar': date2.millisecondsSinceEpoch,
    };
  }

  factory CardSonhoModel.fromFirestore(Map<String, dynamic> map) {
    return CardSonhoModel(
      nomeSonho: map['nome_sonho'] as String,
      valorTotal: map['valor_total'] as double,
      valorAtual: map['valor_atual'] as double,
      adicionarValor: map['adicionar_valor'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date_iniciar'] as int),
      date2: DateTime.fromMillisecondsSinceEpoch(map['date_realizar'] as int),
    );
  }
}
