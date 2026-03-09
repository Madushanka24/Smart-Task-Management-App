import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';
import 'package:intl/intl.dart';
import '../utils/notification_service.dart';
import 'analytics_screen.dart';
import '../services/api_service.dart';

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

  // Schedule notification
  NotificationService.showNotification(
    tasks.length, // unique id
    "Task Reminder",
    "Don't forget: $title",
    deadline.subtract(Duration(hours: 1)), // 1 hour before deadline
  );
  }

  @override
void initState() {
  super.initState();
  loadTasks();
}

void loadTasks() async {
  final data = await ApiService.getTasks();

  setState(() {
    tasks = List<Map<String,String>>.from(data.map((task) => {
      "title": task["title"],
      "priority": task["priority"],
      "deadline": task["deadline"]
    }));
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
          IconButton(
  icon: Icon(Icons.analytics),
  onPressed: () {

    int completed = 0;
    int pending = tasks.length;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnalyticsScreen(
          completedTasks: completed,
          pendingTasks: pending,
        ),
      ),
    );

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
                      final task = tasks[index];
                      return TaskCard(
                        title: task["title"] ?? "No title",
                        priority: task["priority"] ?? "Low",
                        deadline: task["deadline"] ?? "No deadline",
                      );
                    },
                  ),
                )
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