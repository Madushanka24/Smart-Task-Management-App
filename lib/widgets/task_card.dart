import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  final String title;
  final String priority;

  TaskCard({required this.title, required this.priority});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text("Priority: $priority"),
        trailing: Icon(Icons.check_circle_outline),
      ),
    );

  }
}