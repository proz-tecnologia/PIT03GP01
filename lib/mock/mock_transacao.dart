import 'dart:math';
import 'package:srminhaeiro/models/transacao_model.dart';

import '../Util/radom/random_util.dart';

abstract class TransactionMock {
  static List<Transaction> generateTransaction() {
    return List<Transaction>.generate(0, (index) {
      return Transaction(
          transactionType: TransactionType.values[Random().nextInt(2)],
          dateTime: RandomUtil.generateRandomDate(
              DateTime.now().subtract(const Duration(days: 30)), 30),
          description:
              'Trasação #${Random().nextInt(100).toString().padLeft(3, '0')}',
          value: Random().nextDouble() * 1000);
    });
  }
}
