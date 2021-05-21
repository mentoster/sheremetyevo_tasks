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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Уборка снега"),
                Text("16:30"),
              ],
            )));
  }
}
