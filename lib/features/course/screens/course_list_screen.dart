import 'package:celoe/core/constants.dart';
import 'package:flutter/material.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Courses")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.grey[300],
                child: const Icon(Icons.book, color: Colors.grey),
              ),
              title: Text("Course Title ${index + 1}"),
              subtitle: const Text("3 SKS • Semester 5"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/course-detail', arguments: "Course Title ${index+1}");
              },
            ),
          );
        },
      ),
    );
  }
}
