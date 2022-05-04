import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_integration_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page Test', () {
    testWidgets('Clique 5x no botao Incrementar', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.plus_one));
        await Future.delayed(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();

      expect(find.text('5'), findsOneWidget);
    });
  });

  testWidgets('Escreva no campo de texto para alterar o título da página',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    var titulo =
        find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals('Teste de integração'));

    await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals('Home Page'));
  });
}
