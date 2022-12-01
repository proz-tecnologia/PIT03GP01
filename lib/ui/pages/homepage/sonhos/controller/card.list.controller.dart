import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

class CardListController extends ChangeNotifier {
  final List<CardSonhoModel> _sonhoCardList = [];

  List<CardSonhoModel> get sonhoCardList => _sonhoCardList;

  double get getTotalValue {
    double value = 0.0;
    var incomeValue = _sonhoCardList.where((element) => false);
    for (var element in incomeValue) {
      value += element.valorTotal;
    }
    return value;
  }

  addCard(CardSonhoModel cardDescription) {
    _sonhoCardList.add(cardDescription);
    notifyListeners();
  }

  removeCard(CardSonhoModel cardToRemove) async {
    _sonhoCardList.removeWhere((element) => element == cardToRemove);
  }
}
