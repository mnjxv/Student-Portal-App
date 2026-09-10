import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

const Color _headerBlue = Color(0xFF2196F3);

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Sample settings unrelated to the app-wide dark mode state.
  bool notificationsEnabled = true;
  String language = 'English';

  // The same three-item Bottom Navigation Bar used on Home, Profile, and
  // Settings (Part 7, Step 7). Settings is selected here (Part 9, Step 6).
  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: _headerBlue,
      onTap: (index) {
        if (index == 2) return;
        final route = index == 0 ? '/home' : '/profile';
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
      backgroundColor: widget.isDarkMode ? null : bodyBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: _headerBlue,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dark Mode switch, connected to the app-wide state (Part 9,
            // Steps 7-10).
            Card(
              child: SwitchListTile(
                secondary: Icon(
                  widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: _headerBlue,
                ),
                title: const Text('Dark Mode'),
                subtitle: const Text('Switch between light and dark theme'),
                value: widget.isDarkMode,
                activeColor: _headerBlue,
                onChanged: (value) => widget.toggleTheme(),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.notifications, color: _headerBlue),
                title: const Text('Notifications'),
                subtitle: const Text('Receive updates and reminders'),
                value: notificationsEnabled,
                activeColor: _headerBlue,
                onChanged: (value) {
                  setState(() => notificationsEnabled = value);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.language, color: _headerBlue),
                title: const Text('Language'),
                subtitle: Text(language),
                trailing: DropdownButton<String>(
                  value: language,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'English', child: Text('English')),
                    DropdownMenuItem(value: 'Filipino', child: Text('Filipino')),
                    DropdownMenuItem(value: 'Japanese', child: Text('Japanese')),
                    DropdownMenuItem(value: 'French', child: Text('French')),
                    DropdownMenuItem(value: 'Portuguese', child: Text('Portuguese')),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => language = value);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: _headerBlue),
                title: const Text('About'),
                subtitle: const Text('Student Portal v1.0'),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Student Portal',
                    applicationVersion: '1.0.0',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }
}