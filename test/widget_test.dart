import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zayah/app/app.dart';

void main() {
  testWidgets('Zayah home page loads', (tester) async {
    await tester.pumpWidget(const ZayahApp());

    expect(find.text('Trusted services in Kuwait'), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);
  });

  testWidgets('Checkout route opens', (tester) async {
    await tester.pumpWidget(const ZayahApp());

    await tester.tap(find.text('Checkout'));
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.text('Continue to payment'), findsOneWidget);
  });
}
