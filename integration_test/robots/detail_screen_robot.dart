import 'package:ecommerce_app/src/constants/keys_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class DetailScreenRobot {
  DetailScreenRobot(this.tester);
  final WidgetTester tester;

  Future<void> clickOnBackButton({
    required final Widget? parentWidget,
  }) async {
    await tester.pumpAndSettle();

    final Finder backButton = find.byKey(const Key(Keys.backButton));
    await tester.tap(backButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
