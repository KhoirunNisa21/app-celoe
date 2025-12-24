import 'package:celoe/core/constants.dart';
import 'package:celoe/features/course/screens/course_list_screen.dart'; // Will create this
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header / Profile Section
          Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.primary,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi, Mahasiswa",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Informatics Engineering",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          // Academic Summary Cards
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildSummaryCard(
                  context,
                  title: "IPK",
                  value: "3.85",
                  icon: Icons.grade,
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                _buildSummaryCard(
                  context,
                  title: "SKS",
                  value: "144",
                  icon: Icons.book,
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          // Learning Progress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Progress", style: AppTextStyles.heading2),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    const SizedBox(height: 5),
                    const Text("75% of this semester completed"),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Schedule / Upcoming
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Today's Schedule", style: AppTextStyles.heading2),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
          ),
          
          _buildScheduleItem("08:00", "Mobile Application Development", "Room A201"),
          _buildScheduleItem("10:00", "Artificial Intelligence", "Room B102"),
          
          const SizedBox(height: 20),
          
           // Course List Snippet
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My Courses", style: AppTextStyles.heading2),
                 TextButton(
                  onPressed: () {
                     // Normally navigate to full course list, but for now just print or no-op
                     // Since we are inside a tab view, maybe switch tab?
                  }, 
                  child: const Text("See All")
                ),
              ],
            ),
          ),
          
          // Dummy Course Cards
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCourseCard(context, "Mobile Application Development", 80),
                _buildCourseCard(context, "Artificial Intelligence", 45),
                _buildCourseCard(context, "Data Structures", 90),
              ],
            ),
          ),
          const SizedBox(height: 80), // Bottom padding for nav bar
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, {required String title, required String value, required IconData icon, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(25), // 0.1 * 255
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(25), // 0.1 * 255
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: AppTextStyles.heading1),
                Text(title, style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(String time, String subject, String room) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: AppColors.primary, width: 4)),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(13), blurRadius: 4), // 0.05 * 255
        ],
      ),
      child: Row(
        children: [
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(room, style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, int progress) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, '/course-detail', arguments: title);
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withAlpha(50), blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Center(child: Icon(Icons.image, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                  const SizedBox(height: 5),
                  Text("$progress% Complete", style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
