import 'package:flutter/material.dart';
import 'assignment_quiz_card.dart';

class AssignmentsQuizzesView extends StatelessWidget {
  const AssignmentsQuizzesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        AssignmentQuizCard(
          title: 'Quiz Review 01',
          deadline: '25 Februari 2021 23:59 WIB',
          isQuiz: true,
          isCompleted: true,
        ),
        AssignmentQuizCard(
          title: 'Tugas 01 – UID Android Mobile Game',
          deadline: '25 Februari 2021 23:59 WIB',
          isQuiz: false,
          isCompleted: false,
        ),
        AssignmentQuizCard(
          title: 'Kuis – Assessment 2',
          deadline: '25 Februari 2021 23:59 WIB',
          isQuiz: true,
          isCompleted: true,
        ),
      ],
    );
  }
}
