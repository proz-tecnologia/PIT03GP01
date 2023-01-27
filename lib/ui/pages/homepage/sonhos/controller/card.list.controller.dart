import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/models/api_response.model.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_date_difference/flutter_date_difference.dart';

class CardListController extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  final List<CardSonhoModel> _sonhoCardList = [];
  final CardController card = CardController();

  List<CardSonhoModel> get sonhoCardList => _sonhoCardList;

  // ignore: unused_field
  bool _isLoading = true;

  double sonhoParcela = 0.0;

  String nomeSonho = "";

  double sonhoValorTotal = 0.0;

  double sonhovalorAtual = 0.0;

  DateTime dataSonho = DateTime.now();

  nomeSonhoOnChanged(String value) {
    nomeSonho = value;
  }

  sonhoValorTotalOnChanged(double value) {
    sonhoValorTotal = value;
  }

  sonhoAdicionarParcelaOnChanged(double value) {
    sonhoValorTotal = value;
  }

  sonhoValorAtualOnChanged(double value) {
    sonhoValorTotal = value;
  }

  sonhoDataOnChanged(DateTime value) {
    dataSonho = value;
  }

  Future addCard(CardSonhoModel cardDescription) async {
    _sonhoCardList.add(cardDescription);
    notifyListeners();
  }

  Future removeCard(CardSonhoModel cardToRemove) async {
    _sonhoCardList.removeWhere((element) => element == cardToRemove);
    notifyListeners();
  }

  double addmoney(double value) {
    var result = value + card.sonhovalorAtual;
    notifyListeners();
    return result;
  }

  String missingValue(double value1, double value2) {
    var result = value1 - value2;
    return result.obterReal(2);
  }

  String missingValueTostring(double value1, double value2) {
    var result = value1 - value2;
    return result.toString();
  }

  currentValue(
    double value1,
    double value2,
  ) {
    var currentValue = value1 += value2;

    notifyListeners();
    return currentValue;
  }

  fullDate(date) {
    final DateTime dateOne = DateTime.now();
    final DateTime dateTwo = date;

    final result = FlutterDateDifference();

    result.setTexts(
        day: "Dia",
        hour: "Horas",
        dayPlural: "Dias",
        hourPlural: "Horas",
        minute: "Minuto",
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

  String plus(double result) {
    var value = result += sonhoParcela;
    notifyListeners();
    return value.toString();
  }

  Future<ApiResponse<CardSonhoModel>> cloudFirestoreAdd(
      CardSonhoModel model) async {
    try {
      var userCredential = FirebaseAuth.instance.currentUser;

      if (userCredential != null) {
        var docRef = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("Dreamcard")
            .add(model.toMap());
        model.uid = docRef.id;
        sonhoCardList.add(model);
        textEditingController.clear();
        return ApiResponse.sucess(model);
      } else {
        return ApiResponse.error("Ops! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Ops! Deu errado!");
    }
  }

  Future<ApiResponse<List<CardSonhoModel>>> cloudFirestoreGetAll() async {
    try {
      _isLoading = true;
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        sonhoCardList.clear();
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("Dreamcard")
            .get();

        for (var doc in querySnapshot.docs) {
          CardSonhoModel model =
              CardSonhoModel.fromFirestore(doc.data() as Map<String, dynamic>);
          model.uid = doc.id;
          sonhoCardList.add(model);
        }
        _isLoading = false;

        return ApiResponse.sucess(sonhoCardList);
      } else {
        _isLoading = false;
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }

  Future<ApiResponse<bool>> cloudFirestoneUpdate(
      int index, CardSonhoModel model) async {
    try {
      _isLoading = true;
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("Dreamcard")
            .doc(model.uid)
            .update(model.toMap());

        sonhoCardList[index] = model.copyWith(model.nomeSonho, model.valorTotal,
            model.valorAtual, model.adicionarValor, model.date);

        return ApiResponse.sucess(true);
      } else {
        _isLoading = false;
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }

  Future<ApiResponse<bool>> cloudFirestoneDelete(CardSonhoModel model) async {
    try {
      _isLoading = true;
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("Dreamcard")
            .doc(model.uid)
            .delete();

        sonhoCardList.removeWhere((element) => element == model);

        return ApiResponse.sucess(true);
      } else {
        _isLoading = false;
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }
}
