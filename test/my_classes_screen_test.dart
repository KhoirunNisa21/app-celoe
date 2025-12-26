import 'package:celoe/features/course/screens/my_classes_screen.dart';
import 'package:celoe/features/course/widgets/class_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyClassesScreen displays course list and ClassCards', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: MyClassesScreen()));

    // Verify title text
    expect(find.text('Kelas Saya'), findsOneWidget);

    // Verify at least one ClassCard is present (we added dummy data)
    expect(find.byType(ClassCard), findsWidgets);

    // Verify specific course title from dummy data exists
    expect(find.text('BAHASA INGGRIS: BUSINESS DAN SCIENTIFIC'), findsOneWidget);
  });
}
