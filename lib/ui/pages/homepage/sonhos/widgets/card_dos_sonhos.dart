import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/menu.item.dropdown.controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/menu_item_model.dart';

class CardDosSonhos extends StatelessWidget {
  final CardSonhoModel card;
  final MenuItemModel menu = const MenuItemModel();

  const CardDosSonhos(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListController>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 32, bottom: 32),
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xfffff9f9),
                boxShadow: [
                  BoxShadow(
                      inset: true,
                      blurRadius: 4,
                      offset: Offset(-4, -4),
                      color: Color(0xffe9dede)),
                  BoxShadow(
                      inset: true,
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      color: Color(0xffe9dede)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 12, bottom: 8, right: 14),
                          child: SizedBox(
                            width: 110,
                            child: Text(
                              textAlign: TextAlign.start,
                              card.nomeSonho,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        PopupMenuButton<MenuItemModel>(
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                            ...MenuItemDropdownController.removeList
                                .map(buildItem)
                                .toList(),
                            const PopupMenuDivider(),
                            ...MenuItemDropdownController.addEditList
                                .map(buildItem)
                                .toList()
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, bottom: 26),
                    child: Text(
                      card.valorTotal.obterReal(2).toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, bottom: 8),
                    child: SfLinearGauge(
                      interval: 0,
                      minimum: 0,
                      maximum: card.valorTotal,
                      barPointers: const [
                        LinearBarPointer(
                          value: 5000,
                          color: Color(0xff413d3d),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

PopupMenuItem<MenuItemModel> buildItem(MenuItemModel item) => PopupMenuItem(
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            item.text!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

void onSelected(BuildContext context, MenuItemModel item) {
  switch (item) {
    case MenuItemDropdownController.addDindin:
      break;
    case MenuItemDropdownController.editar:
      break;
    case MenuItemDropdownController.excluir:
      Navigator.pop(context);
      break;
    default:
  }
}
