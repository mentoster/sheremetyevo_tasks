import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class TaskNow extends StatelessWidget {
  final Function changeHaveTask;

  const TaskNow(this.changeHaveTask);

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
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                padding: EdgeInsets.only(right: 15),
                child: OutlinedButton(
                  onPressed: () {
                    changeHaveTask();
                  },
                  child: const Text('Выполнено'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
