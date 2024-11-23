// lib/routes.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/screens/login_screen.dart'; 
import 'package:health_tracker2/screens/main_health_screen.dart'; 
import 'package:health_tracker2/screens/profile_screen.dart'; 
import 'package:health_tracker2/screens/registration_screen.dart'; 

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegistrationScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/main': (context) =>  MainHealthScreen(),
};
