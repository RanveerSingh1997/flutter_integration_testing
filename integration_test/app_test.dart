import 'package:flutter/material.dart';
import 'package:flutter_integration_testing/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';


//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


void main() {
  group("App Testing", () {
    testWidgets("Testing Widgets", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      Finder finder = find.byType(FloatingActionButton);
      int i = 0;
      while (i < 100) {
        tester.tap(finder);
        i++;
        Future.delayed(const Duration(seconds: 1));
        tester.pumpAndSettle();
      }
    });
  });
}
