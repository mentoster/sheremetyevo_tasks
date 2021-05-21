import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Icon(Icons.calendar_today),
            foregroundColor: Colors.white,
          ),
          title: Text('Убрать снег.'),
          subtitle: Text('Убрать снег на 7 линии.'),
        ),
      ),
    );
  }
}
