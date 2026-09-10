import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

const Color _headerBlue = Color(0xFF2196F3);

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  Widget _infoTile(
    IconData icon,
    String label,
    String value, {
    Widget? valueWidget,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: _headerBlue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: valueWidget ?? Text(value),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: _headerBlue,
      onTap: (index) {
        if (index == 1) return;
        final route = index == 0 ? '/home' : '/settings';
        Navigator.of(context).pushReplacementNamed(route);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color bodyBackground = Color(0xFFE3F2FD);

    return Scaffold(
      backgroundColor: isDarkMode ? null : bodyBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: _headerBlue,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: _headerBlue,
                    child: Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Aryana Rizanne N. Maranan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('BS Information Technology'),
                  Text(
                    'Specialization in Web & Application Development',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text('4th Year - Section 4A'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _infoTile(
              Icons.badge,
              'Course',
              '',
              valueWidget: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BS Information Technology'),
                  Text(
                    'Specialization in Web & Application Development',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            _infoTile(Icons.grade, 'Year Level', '4th Year'),
            _infoTile(Icons.groups, 'Section', '4A'),
            _infoTile(Icons.email, 'Email', 'student@gmail'),
            _infoTile(Icons.school, 'School', 'Sample State University'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }
}
