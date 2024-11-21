// lib/main.dart

import 'package:flutter/material.dart';
import 'package:health_tracker/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.green, 
        // Green is a common theme color for health-related apps
      ),
      initialRoute: '/login',
      routes: appRoutes,
    );
  }
}
