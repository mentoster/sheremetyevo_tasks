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
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Icon(Icons.flight_takeoff),
              foregroundColor: Colors.white,
            ),
            title: Text('Убрать снег.'),
            subtitle: Text('Убрать снег на 7 линии перед взлетом самолета.'),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Отказаться',
          color: Colors.red,
          icon: Icons.archive,
          onTap: () => Text('Archive'),
        ),
        IconSlideAction(
          caption: 'Принять',
          color: Colors.green,
          icon: Icons.share,
          onTap: () => Text('Share'),
        ),
      ],
    );
  }
}
