import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk [Laporan Akhir Assessment 2 (Tugas Besar)]',
        'subtext': 'Senin, 14 Februari 2021',
        'course': 'D63N-41-DAB1 (DAB)',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk [Laporan Akhir Assessment 2 (Tugas Besar)]',
        'subtext': 'Senin, 14 Februari 2021',
        'course': 'D63N-41-DAB1 (DAB)',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk [Laporan Akhir Assessment 2 (Tugas Besar)]',
        'subtext': 'Senin, 14 Februari 2021',
        'course': 'D63N-41-DAB1 (DAB)',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk [Laporan Akhir Assessment 2 (Tugas Besar)]',
        'subtext': 'Senin, 14 Februari 2021',
        'course': 'D63N-41-DAB1 (DAB)',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 32),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Icon(Icons.description_outlined, size: 24, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['text']!,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['subtext']!,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      item['course']!,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
