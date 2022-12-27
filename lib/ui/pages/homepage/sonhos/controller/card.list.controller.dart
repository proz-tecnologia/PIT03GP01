import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_date_difference/flutter_date_difference.dart';

class CardListController extends ChangeNotifier {
  final List<CardSonhoModel> _sonhoCardList = [];

  final CardController card = CardController();

  List<CardSonhoModel> get sonhoCardList => _sonhoCardList;

  Future addCard(CardSonhoModel cardDescription) async {
    _sonhoCardList.add(cardDescription);
    notifyListeners();
  }

  Future removeCard(CardSonhoModel cardToRemove) async {
    _sonhoCardList.removeWhere((element) => element == cardToRemove);
    notifyListeners();
  }

  Future addmoney(double value1, double value2) async {
    value1 + value2;
    notifyListeners();
  }

  String missingValue(double value1, double value2) {
    var result = value1 - value2;
    return result.obterReal(2);
  }

  fullDate(date) {
    final DateTime dateOne = DateTime.now();
    final DateTime dateTwo = date;

    final result = FlutterDateDifference();

    result.setTexts(
        day: "Dias",
        hour: "Horas",
        dayPlural: "Dias",
        hourPlural: "Horas",
        minute: "Minutos",
        minutePlural: "Minutos",
        month: "Mês",
        monthPlural: "Meses",
        now: "Agora",
        year: "Ano",
        yearPlural: "Anos");
    return result.calculate(dateTwo, dateOne);
  }

  String valueDivideByMonths(double value, date) {
    final DateTime dateOne = DateTime.now();
    final DateTime dateTwo = date;

    final Duration duration = dateTwo.difference(dateOne);
    var inDaysToMonthsResult = duration.inDays / 30.437;
    var calculate = value / inDaysToMonthsResult;
    return calculate.obterReal(2);
  }

  double currentValue = 0.0;

  double plus(double result) {
    return result = currentValue;
  }
}
