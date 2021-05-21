import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      width: double.infinity,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('3'),
            foregroundColor: Colors.white,
          ),
          title: Text('Tile n°'),
          subtitle: Text('SlidableDrawerDelegate'),
        ),
      ),
    ));
  }
}
