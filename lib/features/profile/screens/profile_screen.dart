import 'package:flutter/material.dart';
import '../../../../core/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = ['About Me', 'Kelas', 'Edit Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C), // Maroon background
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            _buildHeader(context),
            
            // White Content Section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Custom Tab Bar
                    _buildCustomTabBar(),
                    
                    const SizedBox(height: 20),
                    
                    // Tab Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: _buildTabContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Bar Shadow/Indicator (matching the bottom nav area color)
            Container(
              height: 10,
              color: const Color(0xFFB71C1C),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
        ),
        const SizedBox(height: 16),
        const Text(
          'DANDY CANDRA PRATAMA',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          bool isSelected = _selectedTabIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: isSelected 
                    ? const Border(bottom: BorderSide(color: Color(0xFFB71C1C), width: 2))
                    : null,
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildAboutMeTab();
      case 1:
        return _buildKelasTab();
      case 2:
        return _buildEditProfileTab();
      default:
        return _buildAboutMeTab();
    }
  }

  Widget _buildAboutMeTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi User',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        _buildInfoItem('Email address', 'dandycandra36@telkomuniversity.ac.id'),
        _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
        _buildInfoItem('Fakultas', 'FIT'),
        
        const SizedBox(height: 24),
        const Text(
          'Aktivitas Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        _buildInfoItem('First access to site', 'Monday, 7 September 2020, 9:27 AM (1168 days 12 hours)'),
        _buildInfoItem('Last access to site', 'Tuesday, 22 June 2021, 11:44 PM (now)'),
        
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('Log Out'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB71C1C),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildKelasTab() {
    final List<Map<String, String>> courses = [
      {'code': 'D63N-41-DAB1 (ARS)', 'name': 'BAHASA INGGRIS BUSINESS AND SCIENTIFIC', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63N-41-DAB1 (ACM)', 'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63N-41-DAB1 (DAB)', 'name': 'KEWARGANEGARAAN', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63N-41-DAB1 (INS)', 'name': 'OLAHRAGA SOFT SKILL', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63M-41-DAB1 (TRB)', 'name': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63M-41-DAB1 (ARN)', 'name': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
      {'code': 'D63N-41-DAB1 (HAN)', 'name': 'SISTEM OPERASI', 'date': 'Tanggal Mulai Monday, 8 February 2021'},
    ];

    return Column(
      children: courses.map((course) => _buildCourseItem(course)).toList(),
    );
  }

  Widget _buildCourseItem(Map<String, String> course) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  course['code']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  course['date']!,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileTab() {
    return Column(
      children: [
        _buildTextField('Nama Pertama'),
        _buildTextField('Nama Terakhir'),
        _buildTextField('E-mail Address'),
        _buildTextField('Negara'),
        _buildTextField('Deskripsi', maxLines: 4),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey,
              side: const BorderSide(color: Colors.grey, width: 0.5),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('Simpan', style: TextStyle(fontSize: 12)),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
