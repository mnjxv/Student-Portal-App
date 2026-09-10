import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

const Color _headerBlue = Color(0xFF2196F3);

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  Widget _quickAccessCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _headerBlue,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).pushNamed(route),
      ),
    );
  }

  // The same three-item Bottom Navigation Bar used on Home, Profile, and
  // Settings (Part 7, Step 7). Home is selected here (Part 7, Step 4).
  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: _headerBlue,
      onTap: (index) {
        if (index == 0) return;
        final route = index == 1 ? '/profile' : '/settings';
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
          'Home',
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
            // Student Profile card.
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 32, color: _headerBlue),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aryana Rizanne N. Maranan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'BS Information Technology',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Specialization in Web & Application Development',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            '3rd Year - Section 3IG2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Quick Access heading.
            const Text(
              'Quick Access',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            _quickAccessCard(
              context,
              icon: Icons.calendar_today,
              title: "Today's Schedule",
              subtitle: 'View your classes for the week',
              route: '/schedules',
            ),
            _quickAccessCard(
              context,
              icon: Icons.assignment,
              title: 'Assignments',
              subtitle: 'Check pending and completed work',
              route: '/assignments',
            ),
            _quickAccessCard(
              context,
              icon: Icons.campaign,
              title: 'Announcements',
              subtitle: 'Read the latest updates',
              route: '/announcements',
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }
}
