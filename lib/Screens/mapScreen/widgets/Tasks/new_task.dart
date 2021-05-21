import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NewTask extends StatelessWidget {
  const NewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        width: double.infinity,
        child: InsideNewTask(),
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
    );
  }
}

class InsideNewTask extends StatelessWidget {
  const InsideNewTask({
    Key? key,
  }) : super(key: key);

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
