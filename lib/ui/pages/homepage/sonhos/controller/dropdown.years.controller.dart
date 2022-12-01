import 'package:flutter/material.dart';

class DropdownYearscontroller with ChangeNotifier {
  var mesesList = [
    " 1 Mês",
    " 2 Meses",
    " 3 Meses",
    " 4 Meses",
    " 5 Meses",
    " 6 Meses",
    " 7 Meses",
    " 8 Meses",
    " 9 Meses",
    " 10 Meses",
    " 11 Meses",
    " 12 Meses",
    " 1 Ano",
    " 2 Anos",
    " 3 Anos",
    " 4 Anos",
    " 5 Anos"
  ];

  var selectedValue = " 1 Mês";

  setMesesValue(value) {
    selectedValue = value;
    notifyListeners();
  }
}
