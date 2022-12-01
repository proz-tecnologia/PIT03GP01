class CardController {
  String nomeSonho = "";

  double sonhoValorTotal = 0.0;

  double sonhovalorAtual = 0.0;

  setCurrentValue(double value) => sonhovalorAtual = value;

  setTotalValue(double value) => sonhoValorTotal = value;

  setDescription(String value) => nomeSonho = value;
}
