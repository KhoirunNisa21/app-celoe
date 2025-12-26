import 'package:celoe/features/dashboard/screens/class_progress_screen.dart';
import 'package:celoe/features/dashboard/widgets/class_progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClassProgressScreen displays items', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: ClassProgressScreen()));

    // Verify title text
    expect(find.text('Progres Kelas'), findsOneWidget);

    // Verify ClassProgressCard widgets are present
    expect(find.byType(ClassProgressCard), findsWidgets);

    // Verify specific content from dummy data
    expect(find.text('Pemrograman Mobile'), findsOneWidget);
    expect(find.text('89%'), findsOneWidget);
  });
}
