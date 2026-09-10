import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AnnouncementsPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AnnouncementsPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    const Color headerBlue = Color(0xFF2196F3);
    const Color bodyBackground = Color(0xFFE3F2FD);

    final announcements = [
      {
        'icon': Icons.event,
        'title': 'Updated Schedule',
        'message':
            'IT 101, Thursdays 5:00 PM - 8:00 PM, moves from SDL2 to Prog Lab 3 starting October 1.',
      },
      {
        'icon': Icons.celebration,
        'title': 'School Event',
        'message':
            'CICT Congress is this Friday, 8:00 AM - 5:00 PM, at the Valencia Hall.',
      },
      {
        'icon': Icons.notifications_active,
        'title': 'Important Reminder',
        'message':
        'Midterm exams run September 7-12. Room assignments are posted outside SDL4.',      
      },
    ];

    return Scaffold(
      backgroundColor: isDarkMode ? null : bodyBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: headerBlue,
        title: const Text(
          'Announcements',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: announcements.map((announcement) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: headerBlue,
                  child: Icon(announcement['icon'] as IconData, color: Colors.white),
                ),
                title: Text(
                  announcement['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(announcement['message'] as String),
                isThreeLine: true,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
