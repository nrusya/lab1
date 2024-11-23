// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/screens/login_screen.dart';
import 'package:health_tracker2/widgets/action_buttons.dart';
import 'package:health_tracker2/widgets/avatar_widget.dart';
import 'package:health_tracker2/widgets/change_password_form.dart';
import 'package:health_tracker2/widgets/edit_profile_form.dart';
import 'package:health_tracker2/widgets/user_info_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? username;
  String? email;
  bool isEditing = false;
  bool isChangingPassword = false;
  bool passwordsMatch = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final List<String> linkedHealthData = [
    'Water Intake: 2000 ml',
    'Steps: 15000',
    'Calories Burned: 500 kcal',
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _newPasswordController.addListener(_checkPasswordsMatch);
    _confirmPasswordController.addListener(_checkPasswordsMatch);
  }

  @override
  void dispose() {
    _newPasswordController.removeListener(_checkPasswordsMatch);
    _confirmPasswordController.removeListener(_checkPasswordsMatch);
    _usernameController.dispose();
    _emailController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        username = prefs.getString('username') ?? 'Unknown User';
        email = prefs.getString('email') ?? 'Unknown Email';
        _usernameController.text = username ?? '';
        _emailController.text = email ?? '';
      });
    }
  }

  Future<void> _saveUserData() async {
    if (_validateEmail(_emailController.text)) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _usernameController.text);
      await prefs.setString('email', _emailController.text);

      if (mounted) {
        setState(() {
          username = _usernameController.text;
          email = _emailController.text;
          isEditing = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email')),
        );
      }
    }
  }

  Future<void> _changePassword() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPassword = prefs.getString('password');
    if (_oldPasswordController.text == savedPassword) {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        if (_validatePassword(_newPasswordController.text)) {
          await prefs.setString('password', _newPasswordController.text);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password updated successfully')),
            );
            setState(() {
              isChangingPassword = false;
            });
          }
          _oldPasswordController.clear();
          _newPasswordController.clear();
          _confirmPasswordController.clear();
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid password')),
            );
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New passwords do not match')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Old password is incorrect')),
        );
      }
    }
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
      isChangingPassword = false;
    });
  }

  void _toggleChangePassword() {
    setState(() {
      isChangingPassword = !isChangingPassword;
      isEditing = false;
    });
  }

  void _logOut(BuildContext context) {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _checkPasswordsMatch() {
    setState(() {
      passwordsMatch =
          _newPasswordController.text == _confirmPasswordController.text;
    });
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
        title: const Text('Profile'),
      ),
      body: isSmallScreen
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: _buildContent(),
            )
          : Padding(
              padding: const EdgeInsets.all(70),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildLinkedHealthData(),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildContent(),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildContent() {
    if (isEditing) {
      return EditProfileForm(
        usernameController: _usernameController,
        emailController: _emailController,
        onSave: _saveUserData,
        onCancel: _toggleEdit,
      );
    } else if (isChangingPassword) {
      return ChangePasswordForm(
        oldPasswordController: _oldPasswordController,
        newPasswordController: _newPasswordController,
        confirmPasswordController: _confirmPasswordController,
        passwordsMatch: passwordsMatch,
        onSave: _changePassword,
        onCancel: _toggleChangePassword,
      );
    } else {
      return Column(
        children: [
          const AvatarWidget(),
          const SizedBox(height: 16),
          UserInfoWidget(
            username: username,
            email: email,
          ),
          const SizedBox(height: 24),
          if (MediaQuery.of(context).size.width < 600) _buildLinkedHealthData(),
          const SizedBox(height: 24),
          ActionButtons(
            onEditProfile: _toggleEdit,
            onChangePassword: _toggleChangePassword,
            onLogOut: () => _logOut(context),
          ),
        ],
      );
    }
  }

  Widget _buildLinkedHealthData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Health Data:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        for (var data in linkedHealthData)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }
}
