import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Map<String, String>> tasks = [
    {"title": "Finish Assignment", "priority": "High"},
    {"title": "Buy Groceries", "priority": "Medium"},
    {"title": "Call Client", "priority": "Low"},
  ];

  void _addTask(String title, String priority, DateTime deadline){
  setState(() {
    tasks.add({
      "title": title,
      "priority": priority,
      "deadline": DateFormat('yyyy-MM-dd').format(deadline),
    });
  });
}

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

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    title: tasks[index]["title"]!,
                    priority: tasks[index]["priority"]!,
                    deadline: tasks[index]["deadline"]!,
                  );
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onAddTask: _addTask),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}