
import 'package:flutter/cupertino.dart';
import 'package:srminhaeiro/mock/mock_transacao.dart';
import 'package:srminhaeiro/models/transacao_model.dart';


class ExtratoProvider extends ChangeNotifier{
  final List<Transaction> _extratoProvider = [];

  TransactionController(){
    _extratoProvider.addAll(TransactionMock.generateTransaction());
    _extratoProvider.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
  }

  List<Transaction> get extratoProvider => _extratoProvider;



  double get getTotalIncoming {
    double value = 0;
    var filtered = extratoProvider
        .where((element) => element.transactionType == TransactionType.INCOME);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }
  double get getTotalOutcoming {
    double value = 0;
    var filtered = extratoProvider
        .where((element) => element.transactionType == TransactionType.EXPENSE);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }

  void add(Transaction item) {
    extratoProvider.add(item);
    extratoProvider.sort(((a, b) => b.dateTime!.compareTo(a.dateTime!)));
    notifyListeners();
  }

  void removeByID(String id) {
    extratoProvider.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void removeByPosition(int index) {
    extratoProvider.removeAt(index);
    notifyListeners();
  }


}