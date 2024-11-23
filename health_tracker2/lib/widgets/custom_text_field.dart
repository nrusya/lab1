// lib/widgets/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.icon = Icons.text_fields,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Slightly more rounded corners
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.green, // Green color for health theme
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.green, // Matching icon color to theme
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.green, // Green border when focused
            width: 2,
          ),
        ),
      ),
    );
  }
}
