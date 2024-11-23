// lib/screens/main_health_screen.dart

import 'package:flutter/material.dart';
import 'package:health_tracker2/widgets/health_card.dart';

class MainHealthScreen extends StatelessWidget {
  MainHealthScreen({super.key});

  final double totalHealthPoints = 12500.75;
  final List<Map<String, String>> healthMetrics = [
    {
      'name': 'Steps',
      'symbol': 'Steps',
      'amount': '15000',
      'icon': '👟',
    },
    {
      'name': 'Calories Burned',
      'symbol': 'kcal',
      'amount': '500',
      'icon': '🔥',
    },
    {
      'name': 'Water Intake',
      'symbol': 'ml',
      'amount': '2000',
      'icon': '💧',
    },
  ];

  void _addNewMetric(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add New Health Metric')),
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
              color: Colors.deepPurpleAccent,
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
                      'Total Health Points',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$totalHealthPoints',
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
                itemCount: healthMetrics.length,
                itemBuilder: (context, index) {
                  final metric = healthMetrics[index];
                  return HealthCard(
                    name: metric['name']!,
                    symbol: metric['symbol']!,
                    amount: double.parse(metric['amount']!),
                    icon: metric['icon']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 155, 90, 253),
        onPressed: () => _addNewMetric(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
