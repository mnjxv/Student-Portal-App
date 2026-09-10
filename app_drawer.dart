import 'package:flutter/material.dart';

const Color _headerBlue = Color(0xFF2196F3);

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _goTo(BuildContext context, String routeName) {
    Navigator.of(context).pop(); // close the drawer first
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            color: _headerBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 28, color: _headerBlue),
                ),
                SizedBox(height: 10),
                Text(
                  'Aryana Rizanne N. Maranan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'BS Information Technology',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Specialization in Web & Application Development',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text('3rd Year', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          // Home / Profile / Settings
          ListTile(
            leading: const Icon(Icons.home, color: _headerBlue),
            title: const Text('Home'),
            onTap: () => _goTo(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: _headerBlue),
            title: const Text('Profile'),
            onTap: () => _goTo(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: _headerBlue),
            title: const Text('Settings'),
            onTap: () => _goTo(context, '/settings'),
          ),

          const Divider(),

          // Schedules / Assignments / Announcements
          ListTile(
            leading: const Icon(Icons.calendar_today, color: _headerBlue),
            title: const Text('Schedules Throughout the Week'),
            onTap: () => _goTo(context, '/schedules'),
          ),
          ListTile(
            leading: const Icon(Icons.assignment, color: _headerBlue),
            title: const Text('Assignments Details'),
            onTap: () => _goTo(context, '/assignments'),
          ),
          ListTile(
            leading: const Icon(Icons.campaign, color: _headerBlue),
            title: const Text('Announcements'),
            onTap: () => _goTo(context, '/announcements'),
          ),

          const Divider(),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Logged out')));
            },
          ),
        ],
      ),
    );
  }
}
