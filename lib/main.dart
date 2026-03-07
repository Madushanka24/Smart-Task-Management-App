import 'package:flutter/material.dart';

void main() {
  runApp(TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("TaskFlow"),
        ),
        body: Center(
          child: Text("Smart Task Manager"),
        ),
      ),
    );
  }
}