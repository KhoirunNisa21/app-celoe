import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import 'material_item_card.dart';

class CourseMaterialsView extends StatelessWidget {
  const CourseMaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Download Materi Offline',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          const MaterialItemCard(
            title: 'Modul 01 – Pengenalan',
            fileType: 'PDF',
            size: '1.2 MB',
            iconInfo: Icons.picture_as_pdf, // Using generic PDF icon
            iconColor: Colors.red,
          ),
          const MaterialItemCard(
            title: 'Video – Implementasi UI',
            fileType: 'Video',
            size: '120 MB',
            iconInfo: Icons.play_circle_fill,
            iconColor: Colors.red,
          ),
          const MaterialItemCard(
            title: 'Slide – Minggu 02',
            fileType: 'PPT',
            size: '4.6 MB',
            iconInfo: Icons.slideshow,
            iconColor: Colors.brown, // Color for PPT often orange/brown
          ),
          const SizedBox(height: 24),
          const Text(
            'Catatan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Text(
              'Fitur offline ini masih berupa layout. Integrasi penyimpanan (misalnya path_provider) dan download manager bisa ditambahkan berikutnya.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
