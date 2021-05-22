import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks_list.dart';

class AllTasks extends StatefulWidget {
  final bool isEngineer;
  AllTasks(this.isEngineer);
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final List<Task> tasks = [
//  Task(0, true, "12:10", "Убрать снег", "Первый участок ИВПП-II", deleteTask),
//     Task(1, true, "12:40", "Убрать снег", "Первый участок РД-1", deleteTask),
//     Task(
//         2, true, "14:50", "Очистить дорогу", "Первый участок РД-1", deleteTask),
  ];
  void addNewTask(
      bool canSwap, String time, String whatDo, String whatSecondDo) {
    final tsk =
        Task(tasks.length, canSwap, time, whatDo, whatSecondDo, deleteTask);

    setState(() {
      tasks.add(tsk);
    });
  }

  void deleteTask(id) {
    setState(() {
      tasks.removeAt(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // TaskNowWorker(),
          TaskList(tasks, deleteTask)
        ],
      ),
    );
  }
}
