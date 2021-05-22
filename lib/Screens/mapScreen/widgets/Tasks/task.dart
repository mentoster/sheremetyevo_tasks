import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskUI extends StatelessWidget {
  final int id;
  final bool canSwap;
  final String time;
  final String whatDo;
  final String whatSecondDo;
  Function deleteElement;
  TaskUI(
    this.id,
    this.canSwap,
    this.time,
    this.whatDo,
    this.whatSecondDo,
    this.deleteElement,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: canSwap
          ? Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                width: double.infinity,
                child: InsideTask(id, time, whatDo, whatSecondDo),
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
          : InsideTask(id, time, whatDo, whatSecondDo),
    );
  }
}

class InsideTask extends StatelessWidget {
  final int id;
  final String time;
  final String whatDo;
  final String whatSecondDo;
  const InsideTask(this.id, this.time, this.whatDo, this.whatSecondDo);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.beenhere_rounded),
          foregroundColor: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(whatDo),
            Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Text(whatSecondDo),
      ),
    );
  }
}
