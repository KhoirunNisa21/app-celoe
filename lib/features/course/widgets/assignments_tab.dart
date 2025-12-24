import 'package:celoe/core/constants.dart';
import 'package:flutter/material.dart';

class AssignmentsTab extends StatelessWidget {
  const AssignmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAssignmentCard(
          "Task 1: Flutter Layouts",
          "Due: Tomorrow, 23:59",
          "Submitted",
          Colors.green,
        ),
        _buildAssignmentCard(
          "Task 2: State Management",
          "Due: Next Week",
          "Pending",
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildAssignmentCard(String title, String deadline, String status, Color statusColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha(25), // 0.1 * 255
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(deadline, style: const TextStyle(color: AppColors.primary)),
            const SizedBox(height: 10),
            const Text("Create a simple Flutter layout using Row and Column widgets..."),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text("Download Soal"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Upload Answer"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
