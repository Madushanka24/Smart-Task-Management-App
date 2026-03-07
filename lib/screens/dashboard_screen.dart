import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class DashboardScreen extends StatelessWidget {

  // Sample tasks (later replaced by API data)
  final List<Map<String, String>> tasks = [
    {"title": "Finish Assignment", "priority": "High"},
    {"title": "Buy Groceries", "priority": "Medium"},
    {"title": "Call Client", "priority": "Low"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            // Task list
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    title: tasks[index]["title"]!,
                    priority: tasks[index]["priority"]!,
                  );
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Task screen later
        },
        child: Icon(Icons.add),
      ),
    );
  }
}