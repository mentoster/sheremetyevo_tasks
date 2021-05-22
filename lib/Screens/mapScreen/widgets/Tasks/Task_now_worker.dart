import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task_now.dart';

class TaskNowWorker extends StatefulWidget {
  @override
  _TaskNowWorkerState createState() => _TaskNowWorkerState();
}

class _TaskNowWorkerState extends State<TaskNowWorker> {
  bool haveTask = true;
  void changeHaveTask() {
    setState(() {
      haveTask = !haveTask;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Text(
          "Задачи на сейчас:",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        haveTask ? TaskNow(changeHaveTask) : Text("Нет задачи"),
      ],
    );
  }
}
