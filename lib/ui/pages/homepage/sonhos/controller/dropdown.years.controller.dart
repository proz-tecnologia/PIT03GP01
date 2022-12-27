import 'package:flutter/material.dart';

class DropdownYearscontroller extends ChangeNotifier {
  var mesesList = [
    "${1} Parcela",
    " ${2} Parcelas",
    " ${3} Parcelas",
    " ${4} Parcelas",
    " ${5} Parcelas",
    " ${6} Parcelas",
    " ${7} Parcelas",
    " ${8} Parcelas",
    " ${9} Parcelas",
    " ${10} Parcelas",
    " ${11} Parcelas",
    " ${12} Parcelas",
    " ${24} Parcelas",
    " ${36} Parcelas",
    " ${48} Parcelas",
    " ${60} Parcelas"
  ];

  var selectedValue = "${1} Parcela";

  setMesesValue(value) {
    selectedValue = value;
    notifyListeners();
  }
}
