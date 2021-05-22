import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task_now.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks_list.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final List<Task> tasks = [
    Task(true, "18:30", "Убрать снег", "Убрать снег на 2 полосе")
  ];
  void _addNewTask(
      bool canSwap, String time, String whatDo, String whatSecondDo) {
    final tsk = Task(
      canSwap,
      time,
      whatDo,
      whatSecondDo,
    );

    setState(() {
      tasks.add(tsk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTask(_addNewTask),
        TaskList(tasks),
      ],
    );
  }
}
