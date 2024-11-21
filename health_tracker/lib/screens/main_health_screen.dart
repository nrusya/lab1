// lib/screens/main_health_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/health_card.dart';

class MainHealthScreen extends StatelessWidget {
  MainHealthScreen({super.key});

  final double totalSteps = 15000;
  final List<Map<String, String>> healthData = [
    {
      'name': 'Steps',
      'unit': 'steps',
      'amount': '15000',
      'icon': '👣',
    },
    {
      'name': 'Calories',
      'unit': 'kcal',
      'amount': '500',
      'icon': '🔥',
    },
    {
      'name': 'Water Intake',
      'unit': 'ml',
      'amount': '2000',
      'icon': '💧',
    },
  ];

  void _addNewHealthData(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add New Health Data')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Health Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Steps',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${totalSteps.toStringAsFixed(2)} steps',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: healthData.length,
                itemBuilder: (context, index) {
                  final data = healthData[index];
                  return HealthCard(
                    name: data['name']!,
                    unit: data['unit']!,
                    amount: double.parse(data['amount']!),
                    icon: data['icon']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 155, 90, 253),
        onPressed: () => _addNewHealthData(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
