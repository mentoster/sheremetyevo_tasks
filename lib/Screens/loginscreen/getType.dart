import 'package:flutter/material.dart';

class GetType extends StatelessWidget {
  final String name;
  final String path;
  GetType(this.path, this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageIcon(
          AssetImage("assets/images/icons/$path.png"),
          color: Colors.blue,
          size: 100,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
