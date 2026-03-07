import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String, String) onAddTask;

  AddTaskScreen({required this.onAddTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final _titleController = TextEditingController();
  String _selectedPriority = "Low";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedPriority,
              items: ["High", "Medium", "Low"].map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPriority = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Priority",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_titleController.text.isNotEmpty){
                    widget.onAddTask(_titleController.text, _selectedPriority);
                    Navigator.pop(context);
                  }
                },
                child: Text("Add Task"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}