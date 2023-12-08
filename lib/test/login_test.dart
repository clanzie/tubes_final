import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tubes_ui/view/home/home.dart';
import 'package:tubes_ui/view/login/login.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);

  testWidgets("Login Test", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    await widgetTester.pumpAndSettle();
    await widgetTester.enterText(find.byType(TextFormField).first, "ryann");
    await widgetTester.pumpAndSettle();
    await widgetTester.enterText(find.byType(TextFormField).last, "123123");
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byType(ElevatedButton).last);
    await widgetTester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(Homepage), findsOneWidget);
    await widgetTester.pumpAndSettle();
  });
}
