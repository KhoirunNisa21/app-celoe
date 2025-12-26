import 'package:flutter/material.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data matching the screenshot
    final List<Map<String, String>> notifications = [
      {
        'title': 'Tugas 01 (UI/UX) mendekati tenggat',
        'subtitle': 'Sisa waktu: 1 hari',
      },
      {
        'title': 'Pengumuman: Info Maintenance Server',
        'subtitle': 'Silakan cek detail pada halaman beranda.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false, 
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return NotificationCard(
            title: item['title']!,
            subtitle: item['subtitle']!,
          );
        },
      ),
    );
  }
}
