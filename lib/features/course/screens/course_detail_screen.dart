import 'package:flutter/material.dart';
import '../../quiz/models/quiz_models.dart';
import '../../quiz/screens/quiz_landing_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Large Red Header
          Container(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 24),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFB71C1C),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'D4SM-42-03 [ADY]',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Semester Genap 2021/2022',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.dashboard_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _buildTab('Materi', true),
                _buildTab('Tugas', false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Tab Content (List of items)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildModuleItem('Materi 1', 'Pengenalan UI/UX dan Design Thinking'),
                _buildModuleItem('Materi 2', 'User Research dan Persona'),
                _buildQuizItem(context, 'Kuis 1', 'Kuis Mingguan 1'),
                _buildModuleItem('Materi 3', 'Information Architecture'),
                _buildModuleItem('Materi 4', 'Interaction Design'),
                _buildModuleItem('Materi 5', 'Prototyping & Testing'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            color: isSelected ? const Color(0xFFB71C1C) : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildModuleItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB71C1C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.book_outlined, color: Color(0xFFB71C1C), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildQuizItem(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        // Create a dummy quiz
        final dummyQuiz = Quiz(
          id: '1',
          title: 'Quiz Review 1',
          description: 'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\n'
              'Jangan lupa klik tombol Submit/Kirim setelah menjawab seluruh pertanyaan.',
          deadline: DateTime(2025, 2, 28, 23, 59),
          closeDate: DateTime(2025, 2, 28, 13, 59),
          durationMinutes: 15,
          gradingMethod: 'Metode Penilaian: Nilai Tertinggi',
          questions: [
            Question(
              id: 'q1',
              text: 'Radio button dapat digunakan untuk menentukan ?',
              options: [
                Option(id: 'a', text: 'Jenis Kelamin'),
                Option(id: 'b', text: 'Alamat'),
                Option(id: 'c', text: 'Hobby'),
                Option(id: 'd', text: 'Riwayat Pendidikan'),
                Option(id: 'e', text: 'Umur'),
              ],
            ),
            Question(
              id: 'q2',
              text: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              options: [
                Option(id: 'a', text: 'Integrasi'),
                Option(id: 'b', text: 'Standarisasi'),
                Option(id: 'c', text: 'Konsistensi'),
                Option(id: 'd', text: 'Relevansi'),
                Option(id: 'e', text: 'Koneksi'),
              ],
            ),
            Question(
              id: 'q3',
              text: 'Warna utama yang digunakan pada brand Telkom University adalah ?',
              options: [
                Option(id: 'a', text: 'Biru'),
                Option(id: 'b', text: 'Merah'),
                Option(id: 'c', text: 'Hijau'),
                Option(id: 'd', text: 'Kuning'),
                Option(id: 'e', text: 'Ungu'),
              ],
            ),
          ],
          attempts: [
            QuizAttempt(
              status: 'Selesai',
              date: DateTime(2025, 2, 25, 10, 30),
              score: 85.0,
              maxScore: 100.0,
            ),
          ],
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLandingScreen(quiz: dummyQuiz),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.quiz_outlined, color: Colors.orange, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
