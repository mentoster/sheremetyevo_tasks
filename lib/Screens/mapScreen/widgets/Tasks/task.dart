import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_task.dart';

class Task extends StatelessWidget {
  const Task({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        Divider(),
        InsideNewTask(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                child: OutlinedButton(
                  onPressed: () {
                    print('Received click');
                  },
                  child: const Text('Выполнено'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
