import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cirrus/cirrus.dart';

void main() {
  testWidgets('CirrusCard renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CirrusCard(
            child: Text('Test'),
          ),
        ),
      ),
    );

    // Verify that our card displays the child text.
    expect(find.text('Test'), findsOneWidget);
  });
}

