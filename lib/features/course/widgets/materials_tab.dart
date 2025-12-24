import 'package:celoe/core/constants.dart';
import 'package:flutter/material.dart';

class MaterialsTab extends StatelessWidget {
  const MaterialsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader("Week 1: Introduction"),
        _buildMaterialItem(Icons.picture_as_pdf, "Course Syllabus", "PDF • 2 MB"),
        _buildMaterialItem(Icons.play_circle_fill, "Lecture 1: Overview", "Video • 45 mins"),
        
        const SizedBox(height: 20),
        
        _buildSectionHeader("Week 2: Basic Concepts"),
        _buildMaterialItem(Icons.picture_as_pdf, "Chapter 1 Slides", "PDF • 5 MB"),
        _buildMaterialItem(Icons.link, "External Resources", "Link"),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: AppTextStyles.heading2),
    );
  }

  Widget _buildMaterialItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.download),
      ),
    );
  }
}
