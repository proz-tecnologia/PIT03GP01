import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srminhaeiro/models/extrato.dart';

class OutputRepository {

  late SharedPreferences sharedPreferences;

  Future <List<Extrato>> getOutputList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString('output_list') ??
        '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Extrato.fromJson(e)).toList();
  }

  void saveOutputList(List<Extrato>outputs) {
    final String jsonString = json.encode(outputs);
    sharedPreferences.setString('output_list', jsonString);
  }
}