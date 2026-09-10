import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SchedulesPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const SchedulesPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final Map<String, List<Map<String, dynamic>>> schedules = {
    'Monday': [
      {
        'subject': 'SSP 101d',
        'time': '1:00 PM - 4:00 PM',
        'instructor': 'Jennet Natividad',
        'room': 'CT 7',
        'color': Colors.red,
      },
    ],
    'Tuesday': [
      {
        'subject': 'IT 303*',
        'time': '7:00 AM - 10:00 AM',
        'instructor': 'Mark Rafael Carlos',
        'room': 'Online',
        'color': Colors.blue,
      },
      {
        'subject': 'CC 107',
        'time': '11:00 AM - 2:00 PM',
        'instructor': 'Dr. Jane K Suarez',
        'room': 'Online',
        'color': Colors.yellow,
      },
      {
        'subject': 'IT 302*',
        'time': '2:00 PM - 4:00 PM',
        'instructor': 'Engr. Evangeline Gonzales',
        'room': 'Online',
        'color': Colors.green,
      },
    ],
    'Wednesday': [
      {
        'subject': 'IT 303*',
        'time': '8:00 AM - 10:00 AM',
        'instructor': 'Mark Rafael Carlos',
        'room': 'Online',
        'color': Colors.blue,
      },
      {
        'subject': 'CC 107',
        'time': '10:00 AM - 12:00 PM',
        'instructor': 'Dr. Jane K Suarez',
        'room': 'Online',
        'color': Colors.yellow,      
      },
      {
        'subject': 'IT 305W',
        'time': '2:00 PM - 4:00 PM',
        'instructor': 'Engr. Alex Caparas',
        'room': 'Online',
        'color': Colors.purple,
      },
    ],
    'Thursday': [
      {
        'subject': 'IT 302*',
        'time': '7:00 AM - 10:00 AM',
        'instructor': 'Engr. Evangeline Gonzales',
        'room': 'A2',
        'color': Colors.green,
      },
      {
        'subject': 'IT 305W',
        'time': '10:00 AM - 1:00 PM',
        'instructor': 'Engr. Alex Caparas',
        'room': 'SDL 4',
        'color': Colors.purple,
      },
      {
        'subject': 'IT 304W',
        'time': '2:00 PM - 5:00 PM',
        'instructor': 'Mark Rafael Carlos',
        'room': 'A3',
        'color': Colors.pink,
      },
      {
        'subject': 'IT 306W',
        'time': '5:00 PM - 8:00 PM',
        'instructor': 'Adrian James De Jesus',
        'room': 'SDL 2',
        'color': Colors.brown,
      },
    ],
    'Friday': [
      {
        'subject': 'IT 304W',
        'time': '7:00 AM - 9:00 AM',
        'instructor': 'Mark Rafael Carlos',
        'room': 'Online',
        'color': Colors.pink,
      },
      {
        'subject': 'IT 306W',
        'time': '9:00 AM - 11:00 AM',
        'instructor': 'Adrian James De Jesus',
        'room': 'Online',
        'color': Colors.brown,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    const Color headerBlue = Color(0xFF2196F3);
    const Color bodyBackground = Color(0xFFE3F2FD);

    return Scaffold(
      backgroundColor: widget.isDarkMode ? null : bodyBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: headerBlue,
        title: const Text(
          'Schedules Throughout the Week',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: schedules.entries.expand((entry) {
            final day = entry.key;
            final classes = entry.value;
            return [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  day,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...classes.map((schedule) {
                final Color subjectColor = schedule['color'] as Color;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: subjectColor,
                      child: const Icon(Icons.laptop, color: Colors.white, size: 20),
                    ),
                    title: Text(
                      schedule['subject'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(schedule['time']),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person, color: Colors.blueGrey),
                        title: Text(schedule['instructor']),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on, color: Colors.redAccent),
                        title: Text(schedule['room']),
                      ),
                    ],
                  ),
                );
              }),
            ];
          }).toList(),
        ),
      ),
    );
  }
}
