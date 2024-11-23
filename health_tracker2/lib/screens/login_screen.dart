// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/widgets/custom_button.dart';
import 'package:health_tracker2/widgets/custom_text_field.dart';
import 'package:health_tracker2/widgets/logo_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if ((_validateEmail(_emailController.text) &&
            _validatePassword(_passwordController.text)) &&
        (_emailController.text == savedEmail &&
            _passwordController.text == savedPassword)) {
      if (mounted) {
        Navigator.pushNamed(context, '/main');
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  void _navigateToRegister() {
    if (mounted) {
      Navigator.pushNamed(context, '/register');
    }
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
                        text: 'Login',
                        onPressed: _handleLogin,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _navigateToRegister,
                        child: const Text("Don't have an account? Register"),
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
                          text: 'Login',
                          onPressed: _handleLogin,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: _navigateToRegister,
                          child: const Text("Don't have an account? Register"),
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
