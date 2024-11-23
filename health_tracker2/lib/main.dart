// lib/main.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/routes.dart'; 

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
      ),
      initialRoute: '/login',
      routes: appRoutes,
    );
  }
}
