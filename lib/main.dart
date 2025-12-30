// fitur profile dan notifikasi
import 'package:celoe/core/theme.dart';
import 'package:celoe/features/auth/screens/login_screen.dart';
import 'package:celoe/features/dashboard/screens/dashboard_screen.dart';
import 'package:celoe/features/course/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CeloeApp());
}

class CeloeApp extends StatelessWidget {
  const CeloeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celoe LMS',
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/course-detail') {
          final String title = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => CourseDetailScreen(title: title),
          );
        }
        return null; // Let it fail or handle 404
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
