
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srminhaeiro/models/extrato.dart';

class InputRepository {

  late SharedPreferences sharedPreferences;

  Future <List<Extrato>> getInputList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString('input_list') ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Extrato.fromJson(e)).toList();
  }

  void saveInputList(List<Extrato>inputs) {
    final String jsonString = json.encode(inputs);
    sharedPreferences.setString('input_list', jsonString);
  }
}
