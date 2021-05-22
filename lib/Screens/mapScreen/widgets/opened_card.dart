import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/all_tasks.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/create_new_task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/Task_now_worker.dart';

class WorkerBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TaskNowWorker(),
          AllTasks(),
        ],
      ),
    );
  }
}

class EngineerBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          NewTaskMenu(),
          AllTasks(),
        ],
      ),
    );
  }
}
