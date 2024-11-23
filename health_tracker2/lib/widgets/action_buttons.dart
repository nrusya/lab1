// lib/widgets/action_buttons.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/widgets/custom_button.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onChangePassword;
  final VoidCallback onLogOut;

  const ActionButtons({
    required this.onEditProfile,
    required this.onChangePassword,
    required this.onLogOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Change Password',
          onPressed: onChangePassword,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Edit Profile',
                onPressed: onEditProfile,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Log Out',
                onPressed: onLogOut,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
