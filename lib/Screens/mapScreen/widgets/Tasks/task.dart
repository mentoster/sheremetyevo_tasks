import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  final bool canSwap;
  final String time;
  final String whatDo;
  final String whatSecondDo;
  Task(this.canSwap, this.time, this.whatDo, this.whatSecondDo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: canSwap
          ? Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                width: double.infinity,
                child: InsideTask(time, whatDo, whatSecondDo),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Отказаться',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => Text('Share'),
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Начать',
                  color: Colors.green,
                  icon: Icons.check,
                  onTap: () => Text('Share'),
                ),
              ],
            )
          : InsideTask(time, whatDo, whatSecondDo),
    );
  }
}

class InsideTask extends StatelessWidget {
  final String time;
  final String whatDo;
  final String whatSecondDo;
  const InsideTask(this.time, this.whatDo, this.whatSecondDo);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.flight_takeoff),
          foregroundColor: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Убрать снег.'),
            Text(
              'До 18:30',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Text('Убрать снег на 7 линии перед взлетом самолета.'),
      ),
    );
  }
}
