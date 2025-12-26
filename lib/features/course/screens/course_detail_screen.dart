import 'package:celoe/core/constants.dart';
import 'package:celoe/features/course/widgets/course_materials_view.dart';
import 'package:celoe/features/course/widgets/assignments_quizzes_view.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: "Materi"),
              Tab(text: "Tugas Dan Kuis"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CourseMaterialsView(),
            AssignmentsQuizzesView(),
          ],
        ),
      ),
    );
  }
}
