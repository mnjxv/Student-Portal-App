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
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
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
