import 'package:flutter/material.dart';
import 'package:flutter_integration_test/main.dart';
import 'package:flutter_integration_test/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Increment Counter on HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Change Title on HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var titulo =
        find.byKey(const Key('titulo')).evaluate().single.widget as Text;

    expect(find.byType(HomePage), findsOneWidget);
    expect(titulo.data, equals('Teste de integração'));

    await tester.enterText(find.byKey(const Key('tituloInput')), 'Teste 2');
    await tester.pumpAndSettle();

    titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals("Teste 2"));
  });
}
