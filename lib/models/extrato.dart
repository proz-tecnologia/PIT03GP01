import 'package:intl/intl.dart';
class Extrato{
  Extrato({required this.title, required this.date, required this.description});
  Extrato.fromJson(Map<String, dynamic>json)
      :title =json['title'],
        description=json['description'],
        date = DateTime.parse(json['datetime']);

  String title;
  String description;
  DateTime date;

  Map<String, dynamic>toJson(){
    return{
      'title':title,
      'description': description,
      'datetime': date.toIso8601String(),
    };
  }
}
extension ExtensionDouble on double {
  String get formatBRL {
    return NumberFormat.currency(locale: 'pt_BR', symbol: "R\$").format(this);
  }
}
