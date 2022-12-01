
import 'package:uuid/uuid.dart';

class Transaction {
  String id = const Uuid().v4();
  TransactionType transactionType;
  DateTime? dateTime;
  String description;
  double value;

  Transaction(
      {this.transactionType = TransactionType.INCOME,
        this.dateTime,
        this.description = "",
        this.value = 0.0});
}

enum TransactionType { INCOME, EXPENSE }
