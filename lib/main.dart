import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Tracker Test App'),
        ),
        body: ActivityInputField(),
      ),
    );
  }
}

class ActivityInputField extends StatefulWidget {
  const ActivityInputField({super.key});

  @override
  _ActivityInputFieldState createState() => _ActivityInputFieldState();
}

class _ActivityInputFieldState extends State<ActivityInputField> {
  String _activityName = '';
  String _activityIcon = '🏃‍♂️';

  void _updateActivityIcon(String name) {
    setState(() {
      _activityName = name;
      switch (name.toLowerCase()) {
        case 'running':
          _activityIcon = '🏃‍♂️';
          break;
        case 'cycling':
          _activityIcon = '🚴‍♂️';
          break;
        case 'swimming':
          _activityIcon = '🏊‍♂️';
          break;
        default:
          _activityIcon = '❓';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Enter Activity Type:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            onChanged: _updateActivityIcon,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Activity',
              prefixIcon: const Icon(Icons.fitness_center),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _activityIcon,
            style: const TextStyle(fontSize: 100, color: Colors.greenAccent),
          ),
          Text(
            _activityName.isEmpty
                ? 'No activity entered'
                : _activityName.toUpperCase(),
            style: const TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(100, 100, 100, 0.5)),
          ),
        ],
      ),
    );
  }
}
