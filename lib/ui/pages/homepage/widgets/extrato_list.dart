// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../../../../models/extrato.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExtratoListItem extends StatelessWidget {
  ExtratoListItem({Key? key, required this.input, required this.onDelete})
      : super(key: key);

  final Extrato input;
  final Function(Extrato) onDelete;
  final TextEditingController inputController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 198, 190, 190),
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  input.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(input.date),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  input.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.east,
                  size: 32,
                  color: Colors.green,
                ),
              ],
            ),
          ]),
        ),
        actionExtentRatio: 0.2,
        actionPane: const SlidableStrechActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.redAccent,
            icon: Icons.delete_forever_sharp,
            caption: 'Deletar',
            onTap: () {
              onDelete(input);
            },
          ),
        ],
      ),
    );
  }
}

class ExtratoListItemOutput extends StatelessWidget {
  ExtratoListItemOutput(
      {Key? key, required this.output, required this.onDelete})
      : super(key: key);
  final Extrato output;
  final Function(Extrato) onDelete;
  final TextEditingController outputController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 198, 190, 190),
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  output.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(output.date),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  output.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.west,
                  size: 32,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ]),
        ),
        actionExtentRatio: 0.2,
        actionPane: const SlidableStrechActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.redAccent,
            icon: Icons.delete_forever_sharp,
            caption: 'Deletar',
            onTap: () {
              onDelete(output);
            },
          ),
        ],
      ),
    );
  }
}
