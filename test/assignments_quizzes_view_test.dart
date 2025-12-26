import 'package:celoe/features/course/widgets/assignments_quizzes_view.dart';
import 'package:celoe/features/course/widgets/assignment_quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AssignmentsQuizzesView displays all cards from screenshot', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: AssignmentsQuizzesView()));

    // Verify Quiz Review 01
    expect(find.text('Quiz Review 01'), findsOneWidget);
    expect(find.text('QUIZ'), findsNWidgets(2)); // Quiz Review 01 and Kuis - Assessment 2

    // Verify Tugas 01
    expect(find.text('Tugas 01 – UID Android Mobile Game'), findsOneWidget);
    expect(find.text('Tugas'), findsOneWidget);

    // Verify Kuis Assessment 2
    expect(find.text('Kuis – Assessment 2'), findsOneWidget);

    // Verify Checkmarks (isCompleted)
    // Quiz Review 01 (true)
    // Tugas 01 (false)
    // Kuis Assessment 2 (true)
    // So we expect 2 green ones and 1 grey one conceptually, 
    // but in code we check color/icon.
    expect(find.byIcon(Icons.check_circle), findsNWidgets(3));
  });
}
