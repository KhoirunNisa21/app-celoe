import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../widgets/class_card.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data matching the screenshot provided by user
    final List<Map<String, String>> classes = [
      {
        'title': 'BAHASA INGGRIS: BUSINESS DAN SCIENTIFIC',
        'semester': '2021/2',
        'code': 'D4SM-41-GABI',
        'lecturers': 'ARS',
        'image': 'https://placehold.co/100x100/e0f7fa/006064.png?text=BI',
      },
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
        'semester': '2021/2',
        'code': 'D4SM-42-03',
        'lecturers': 'ADY',
        'image': 'https://placehold.co/100x100/f3e5f5/4a148c.png?text=UI/UX',
      },
      {
        'title': 'KEWARGANEGARAAN',
        'semester': '2021/2',
        'code': 'D4SM-41-GABI',
        'lecturers': 'BBO',
        'image': 'https://placehold.co/100x100/ffebee/b71c1c.png?text=KWN',
      },
      {
        'title': 'OLAH RAGA',
        'semester': '2021/2',
        'code': 'D3TT-44-02',
        'lecturers': 'EYR',
        'image': 'https://placehold.co/100x100/e8f5e9/1b5e20.png?text=Sport',
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
        'semester': '2021/2',
        'code': 'D4SM-43-04',
        'lecturers': 'TPR',
        'image': 'https://placehold.co/100x100/fff3e0/e65100.png?text=PMI',
      },
      {
        'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
        'semester': '2021/2',
        'code': 'D4SM-41-GABI',
        'lecturers': 'APJ',
        'image': 'https://placehold.co/100x100/e3f2fd/0d47a1.png?text=Mobile',
      },
      {
        'title': 'SISTEM OPERASI',
        'semester': '2021/2',
        'code': 'D4SM-44-02',
        'lecturers': 'DDS',
        'image': 'https://placehold.co/100x100/fce4ec/880e4f.png?text=OS',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final course = classes[index];
          return ClassCard(
            title: course['title']!,
            semester: course['semester']!,
            classCode: course['code']!,
            lecturers: course['lecturers']!,
            imageUrl: course['image']!,
          );
        },
      ),
    );
  }
}
