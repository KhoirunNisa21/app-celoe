import 'package:celoe/core/constants.dart';
import 'package:flutter/material.dart';

class ForumTab extends StatelessWidget {
  const ForumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(child: Icon(Icons.person)),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Student ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Text("2 hours ago", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Discussion Topic ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 5),
                      const Text("Can someone explain the difference between Stateful and Stateless widgets in more detail?"),
                      const SizedBox(height: 10),
                      const Divider(),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.comment, size: 16, color: Colors.grey),
                          const SizedBox(width: 5),
                          const Text("5 Replies"),
                          const SizedBox(width: 15),
                          const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                          const SizedBox(width: 5),
                          const Text("12 Likes"),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Start a discussion...",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                mini: true,
                onPressed: () {},
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
