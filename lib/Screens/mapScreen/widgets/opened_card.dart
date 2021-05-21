import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/new_task.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NewTask(),
    );
  }
}

class Task extends StatelessWidget {
  const Task({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Text(
          "Нужно:",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        Container(child: Text("Очистить снег на 7 линии")),
        Container(
          height: 50,
          child: LiquidLinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
            backgroundColor: Theme.of(context).backgroundColor,
            borderColor: Theme.of(context).accentColor,
            borderWidth: 3.0,
            borderRadius: 15.0,
            direction: Axis.horizontal,
            center: Text("Осталось 50 минут"),
          ),
        ),
      ],
    );
  }
}
