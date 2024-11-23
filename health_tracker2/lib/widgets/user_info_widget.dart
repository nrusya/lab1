// lib/widgets/user_info_widget.dart

import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String? username;
  final String? email;

  const UserInfoWidget({
    required this.username,
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          username ?? 'Loading...',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green, 
          ),
        ),
        const SizedBox(height: 8),
        Text(
          email ?? 'Loading...',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
