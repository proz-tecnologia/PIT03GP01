import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transacao_model.dart';

class ItemTransaction extends StatefulWidget {
  final Transaction transaction;

  const ItemTransaction(this.transaction, {super.key});

  @override
  State<ItemTransaction> createState() => _ItemTransactionState();
}

class _ItemTransactionState extends State<ItemTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: getIcon(),
        title: Text(widget.transaction.description,
            style: TextStyle(fontSize: 18, color: getColor())),
        subtitle: Text(
            "${widget.transaction.dateTime?.day}/${widget.transaction.dateTime?.month}",
            style: TextStyle(fontSize: 12, color: getColor())),
        trailing:
            Text(getValue(), style: TextStyle(fontSize: 16, color: getColor())),
      ),
    );
  }

  Color getColor() {
    switch (widget.transaction.transactionType) {
      case TransactionType.INCOME:
        return const Color.fromARGB(255, 123, 255, 127);
      case TransactionType.EXPENSE:
        return const Color.fromARGB(255, 241, 187, 10);
    }
  }

  String getValue() {
    switch (widget.transaction.transactionType) {
      case TransactionType.INCOME:
        return '+ ${widget.transaction.value.formatBRL}';
      case TransactionType.EXPENSE:
        return "- ${widget.transaction.value.formatBRL}";
    }
  }

  getIcon() {
    switch (widget.transaction.transactionType) {
      case TransactionType.INCOME:
        return const Icon(
          Icons.east,
          color: Color.fromARGB(255, 123, 255, 127),
        );
      case TransactionType.EXPENSE:
        return const Icon(
          Icons.west,
          color: Color.fromARGB(255, 241, 187, 10),
        );
    }
  }
}

extension ExtensionDouble on double {
  String get formatBRL {
    return NumberFormat.currency(locale: 'pt_BR', symbol: "R\$").format(this);
  }
}
