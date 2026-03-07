import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  final String title;
  final String priority;

  TaskCard({required this.title, required this.priority});

  // Color based on priority
  Color getPriorityColor() {
    switch(priority.toLowerCase()) {
      case "high":
        return Colors.red;
      case "medium":
        return Colors.orange;
      case "low":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: getPriorityColor(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            priority,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}