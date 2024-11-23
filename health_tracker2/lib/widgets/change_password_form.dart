// lib/widgets/change_password_form.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/widgets/custom_button.dart';
import 'package:health_tracker2/widgets/custom_text_field.dart';

class ChangePasswordForm extends StatelessWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final bool passwordsMatch;

  const ChangePasswordForm({
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.onSave,
    required this.onCancel,
    required this.passwordsMatch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Old Password',
          controller: oldPasswordController,
          icon: Icons.lock,
          isPassword: true,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'New Password',
          controller: newPasswordController,
          icon: Icons.lock,
          isPassword: true,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Confirm New Password',
          controller: confirmPasswordController,
          icon: Icons.lock,
          isPassword: true,
        ),
        if (!passwordsMatch)
          const Text(
            'Passwords do not match!',
            style: TextStyle(color: Colors.red),
          ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Save',
                onPressed: onSave,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                onPressed: onCancel,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
