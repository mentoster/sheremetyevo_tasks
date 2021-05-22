import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks_list.dart';

class NewTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Новые задания:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TaskList([NewTask()]),
        ],
      ),
    );
  }
}
