import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_models.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  late List<int?> _selectedOptionIndices;
  late Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _selectedOptionIndices = List.generate(widget.quiz.questions.length, (index) => null);
    _secondsRemaining = widget.quiz.durationMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
        // Handle timeout
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Timer
          Container(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFB71C1C),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Quiz Review 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, color: Colors.white, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(_secondsRemaining),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Grid
                  Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(widget.quiz.questions.length, (index) {
                        bool isAnswered = _selectedOptionIndices[index] != null;
                        bool isCurrent = _currentQuestionIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentQuestionIndex = index;
                            });
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: isCurrent 
                                  ? Colors.grey[400] 
                                  : (isAnswered ? Colors.green : Colors.transparent),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: (isAnswered || isCurrent) ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  Text(
                    'Soal Nomor ${_currentQuestionIndex + 1} / ${widget.quiz.questions.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  
                  const SizedBox(height: 24),
                  Text(
                    currentQuestion.text,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  
                  const SizedBox(height: 24),
                  // Options
                  ...List.generate(currentQuestion.options.length, (index) {
                    bool isSelected = _selectedOptionIndices[_currentQuestionIndex] == index;
                    String letter = String.fromCharCode(65 + index); // A, B, C, D, E
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOptionIndices[_currentQuestionIndex] = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFEF5350) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]!),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                '$letter. ',
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  currentQuestion.options[index].text,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentQuestionIndex > 0)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _currentQuestionIndex--;
                            });
                          },
                          child: const Text(
                            'Soal Sebelumnya',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      
                      ElevatedButton(
                        onPressed: () {
                          if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
                            setState(() {
                              _currentQuestionIndex++;
                            });
                          } else {
                            // Finish quiz
                            _showFinishDialog();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentQuestionIndex < widget.quiz.questions.length - 1
                              ? Colors.white
                              : Colors.green,
                          foregroundColor: _currentQuestionIndex < widget.quiz.questions.length - 1
                              ? Colors.black
                              : Colors.white,
                          side: _currentQuestionIndex < widget.quiz.questions.length - 1
                              ? BorderSide(color: Colors.grey[300]!)
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(_currentQuestionIndex < widget.quiz.questions.length - 1
                            ? 'Soal Selanjutnya'
                            : 'Selesai'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selesai?'),
        content: const Text('Apakah Anda yakin ingin mengumpulkan kuis ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to landing
            },
            child: const Text('Kumpulkan'),
          ),
        ],
      ),
    );
  }
}
