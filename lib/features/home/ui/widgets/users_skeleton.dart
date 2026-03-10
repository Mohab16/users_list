import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UsersSkeleton extends StatelessWidget {
  const UsersSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          5,
          (index) => Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(child: Text('AH')),
              title: const Text('Ahmed Hassan Mohamed'),
              subtitle: const Text('ahmed.hassan@gmail.com'),
              trailing: Chip(
                label: const Text('admin', style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.blue[100],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
