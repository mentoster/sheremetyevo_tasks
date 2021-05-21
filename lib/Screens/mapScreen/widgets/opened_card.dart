import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
      ),
    );
  }
}
