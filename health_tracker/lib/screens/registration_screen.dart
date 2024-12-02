// lib/screens/registration_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/custom_button.dart';
import 'package:health_tracker/widgets/custom_text_field.dart';
import 'package:health_tracker/widgets/logo_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegistration() {
      }

  void _navigateToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: isSmallScreen
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoWidget(size: 100),
                      const SizedBox(height: 24),
                      CustomTextField(
                        label: 'Username',
                        controller: _usernameController,
                        icon: Icons.account_circle,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Email',
                        controller: _emailController,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Password',
                        controller: _passwordController,
                        isPassword: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        text: 'Register',
                        onPressed: _handleRegistration,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _navigateToLogin,
                        child: const Text('Already have an account? Login'),
                      ),
                    ],
                  )
                : Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LogoWidget(),
                        const SizedBox(height: 24),
                        CustomTextField(
                          label: 'Username',
                          controller: _usernameController,
                          icon: Icons.account_circle,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: 'Email',
                          controller: _emailController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                          icon: Icons.lock,
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'Register',
                          onPressed: _handleRegistration,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: _navigateToLogin,
                          child: const Text('Already have an account? Login'),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
