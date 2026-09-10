import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AssignmentsPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AssignmentsPage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  final List<Map<String, String>> assignments = [
    {
      'title': 'To-Do List',
      'dueDate': 'July 30, 2026',
      'description':
          'A simple Flutter app for creating and checking off tasks on a to-do list.',
      'status': 'Completed',
    },
    {
      'title': 'System Blueprint and Defect Prevention Map',
      'dueDate': 'July 16, 2026',
      'description':
          'This activity aligns system design with early defect prevention to embed quality upfront.',
      'status': 'Completed',
    },
    {
      'title': 'Accenture - Learning to Earning',
      'dueDate': 'September 15, 2026',
      'description':
          'Empowering learners with job‑ready skills to convert knowledge into career opportunities.',
      'status': 'Pending',
    },
  ];

  Color _statusColor(String status) {
    return status == 'Completed' ? Colors.green : Colors.orange;
  }

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
          'Assignment Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: assignments.map((assignment) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ExpansionTile(
                leading: Icon(Icons.assignment, color: headerBlue),
                title: Text(
                  assignment['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Due: ${assignment['dueDate']}'),
                trailing: Chip(
                  label: Text(
                    assignment['status']!,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: _statusColor(assignment['status']!),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(assignment['description']!),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}