// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_dos_sonhos.dart';

void main() {
  final card = CardSonhoModel(
      nomeSonho: "Meu Sonho",
      valorTotal: 30000,
      valorAtual: 0.0,
      adicionarValor: 0.0,
      date: DateTime.now(),
      date2: DateTime.now());
  testWidgets('Validate buttons', (widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CardListController()),
        ],
        child: MaterialApp(
          home: Material(child: CardDosSonhos(card)),
        )));

    // Verify that there isn´t the texts blow that belongs to another page.
    expect(find.text("Login"), findsNothing);
    expect(find.text("Cadastre-se"), findsNothing);
    expect(find.text("cancelar"), findsNothing);

    // Find and Tap the iconbuttons below without warn.
    await widgetTester.tap(find.byIcon(Icons.add_circle), warnIfMissed: false);
    await widgetTester.pump();
    await widgetTester.tap(find.byIcon(Icons.remove_circle),
        warnIfMissed: false);
    await widgetTester.pump();
  });
}
