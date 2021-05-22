import 'package:flutter/material.dart';

class GetCharacter extends StatelessWidget {
  final String name;
  final Color color;
  GetCharacter(
    this.name,
    this.color,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageIcon(
        AssetImage("assets/images/icons/Inzh.png"),
        color: color,
        size: 100,
      ),
      Text(name)
    ]);
  }
}
