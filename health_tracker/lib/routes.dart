// lib/routes.dart

import 'package:flutter/material.dart';
import 'package:health_tracker/screens/login_screen.dart';
import 'package:health_tracker/screens/main_health_screen.dart'; 
import 'package:health_tracker/screens/profile_screen.dart';
import 'package:health_tracker/screens/registration_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegistrationScreen(),
  '/profile': (context) => ProfileScreen(),
  '/main': (context) => MainHealthScreen(), 
};
