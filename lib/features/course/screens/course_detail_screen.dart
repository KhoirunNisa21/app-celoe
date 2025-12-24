import 'package:celoe/core/constants.dart';
import 'package:celoe/features/course/widgets/materials_tab.dart';
import 'package:celoe/features/course/widgets/forum_tab.dart';
import 'package:celoe/features/course/widgets/assignments_tab.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Materials"),
              Tab(text: "Forum"),
              Tab(text: "Assignments"),
              Tab(text: "Quiz"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MaterialsTab(),
            const ForumTab(),
            const AssignmentsTab(),
            const Center(child: Text("Quiz Feature (Coming Soon)")),
          ],
        ),
      ),
    );
  }
}
