import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

import '../model/menu_item_model.dart';

class MenuItemDropdownController {
  final CardSonhoModel card;

  MenuItemDropdownController(this.card);
  CardListController cardList = CardListController();
  static const List<MenuItemModel> _firstItems = [
    addDindin,
    editar,
  ];
  static const List<MenuItemModel> _secondItems = [excluir];

  static List<MenuItemModel> get addEditList => _firstItems;

  static List<MenuItemModel> get removeList => _secondItems;

  static const addDindin =
      MenuItemModel(text: 'Add dinheiro', icon: Icons.payment);
  static const editar = MenuItemModel(text: 'Editar', icon: Icons.edit);

  static const excluir =
      MenuItemModel(text: 'Excluir', icon: Icons.remove_circle);

  void onSelected(BuildContext context, MenuItemModel item) {
    switch (item) {
      case MenuItemDropdownController.addDindin:
        break;
      case MenuItemDropdownController.editar:
        break;
      case MenuItemDropdownController.excluir:
        cardList.removeCard(card);
        break;
      default:
    }
  }
}
