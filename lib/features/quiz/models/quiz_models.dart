import 'package:flutter/material.dart';

class Quiz {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final DateTime closeDate;
  final int durationMinutes;
  final String gradingMethod;
  final List<Question> questions;
  final List<QuizAttempt> attempts;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.closeDate,
    required this.durationMinutes,
    required this.gradingMethod,
    required this.questions,
    this.attempts = const [],
  });
}

class Question {
  final String id;
  final String text;
  final List<Option> options;
  final int? selectedOptionIndex;
  final bool isAnswered;

  Question({
    required this.id,
    required this.text,
    required this.options,
    this.selectedOptionIndex,
    this.isAnswered = false,
  });

  Question copyWith({
    int? selectedOptionIndex,
    bool? isAnswered,
  }) {
    return Question(
      id: id,
      text: text,
      options: options,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }
}

class Option {
  final String id;
  final String text;

  Option({
    required this.id,
    required this.text,
  });
}

class QuizAttempt {
  final String status;
  final DateTime date;
  final double score;
  final double maxScore;

  QuizAttempt({
    required this.status,
    required this.date,
    required this.score,
    required this.maxScore,
  });
}
