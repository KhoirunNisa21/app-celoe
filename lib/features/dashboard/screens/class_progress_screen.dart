import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../widgets/class_progress_card.dart';

class ClassProgressScreen extends StatelessWidget {
  const ClassProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data for Class Progress (consistent with MyClassesScreen)
    final List<Map<String, dynamic>> classProgressList = [
      {
        'title': 'Pemrograman Mobile',
        'subtitle': 'Dosen: Dr. Budi Santoso',
        'progress': 0.89,
        'label': '89%',
      },
      {
        'title': 'Desain Antarmuka Pengguna',
        'subtitle': 'Dosen: Siti Aminah, M.Kom',
        'progress': 0.90,
        'label': '90%',
      },
      {
        'title': 'Bahasa Inggris: Business',
        'subtitle': 'Dosen: ARS',
        'progress': 0.75,
        'label': '75%',
      },
      {
        'title': 'Kewarganegaraan',
        'subtitle': 'Dosen: BBO',
        'progress': 1.0,
        'label': '100%',
      },
      {
        'title': 'Sistem Operasi',
        'subtitle': 'Dosen: DDS',
        'progress': 0.45,
        'label': '45%',
      },
      {
        'title': 'Pemrograman Multimedia',
        'subtitle': 'Dosen: TPR',
        'progress': 0.60,
        'label': '60%',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Progres Kelas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classProgressList.length,
        itemBuilder: (context, index) {
          final item = classProgressList[index];
          return ClassProgressCard(
            title: item['title'],
            subtitle: item['subtitle'],
            progress: item['progress'],
            progressLabel: item['label'],
          );
        },
      ),
    );
  }
}
