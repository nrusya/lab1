// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker/screens/login_screen.dart';
import 'package:health_tracker/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  final String username = 'Joe Saari';
  final String email = 'joesaari@gmail.com';
  final List<String> healthDataRecords = [
    'Step Count: 15000',
    'Calories Burned: 500',
    'Water Intake: 2000ml',
  ];

  ProfileScreen({super.key});

  void _editProfile() {
    // Edit profile functionality
  }

  void _logOut(BuildContext context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: isSmallScreen
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('lib/assets/avatar.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Health Records:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  for (var record in healthDataRecords)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        record,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Edit Profile',
                          onPressed: _editProfile,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: 'Log Out',
                          onPressed: () => _logOut(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(70),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const Text(
                          'Health Records:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        for (var record in healthDataRecords)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              record,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('lib/assets/avatar.png'),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          email,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'Edit Profile',
                          onPressed: _editProfile,
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'Log Out',
                          onPressed: () => _logOut(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
