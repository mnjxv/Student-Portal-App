import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/schedules_page.dart';
import 'pages/announcements_page.dart';
import 'pages/assignments_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Part 2, Step 4: Boolean state variable that determines whether
  // Dark Mode is active.
  bool isDarkMode = false;

  // Flips dark mode on/off. Passed down to every page so the Settings
  // switch (and the AppBar icon on other pages) can control it.
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      // Part 2, Step 6: Disable the debug banner.
      debugShowCheckedModeBanner: false,
      // Part 2, Step 5: light theme, dark theme, theme mode driven by
      // the Boolean variable above.
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // Part 2, Step 7: Home page is the first screen shown when the
      // app starts.
      home: HomePage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
      // Part 3: Named routes, one per page, each wired to its screen.
      routes: {
        '/home': (context) =>
            HomePage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
        '/profile': (context) =>
            ProfilePage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
        '/settings': (context) =>
            SettingsPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
        '/schedules': (context) =>
            SchedulesPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
        '/assignments': (context) =>
            AssignmentsPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
        '/announcements': (context) => AnnouncementsPage(
            isDarkMode: isDarkMode, toggleTheme: toggleTheme),
      },
    );
  }
}