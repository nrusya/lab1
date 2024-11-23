// lib/widgets/edit_profile_form.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/widgets/custom_button.dart';
import 'package:health_tracker2/widgets/custom_text_field.dart';

class EditProfileForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EditProfileForm({
    required this.usernameController,
    required this.emailController,
    required this.onSave,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Username',
          controller: usernameController,
          icon: Icons.account_circle,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Email',
          controller: emailController,
          icon: Icons.email,
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
