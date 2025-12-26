import 'package:celoe/features/notification/screens/notification_screen.dart';
import 'package:celoe/features/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotificationScreen displays items', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));

    // Verify title text
    expect(find.text('Notifikasi'), findsOneWidget);

    // Verify NotificationCard widgets are present
    expect(find.byType(NotificationCard), findsWidgets);

    // Verify specific content from dummy data
    expect(find.text('Tugas 01 (UI/UX) mendekati tenggat'), findsOneWidget);
    expect(find.text('Sisa waktu: 1 hari'), findsOneWidget);
  });
}
