import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom();
    return Container(
        child: InteractiveViewer(
      maxScale: 15,
      minScale: 1,
      child: Center(
        child: Stack(children: [
          Image(image: AssetImage("assets/images/shema1opt.jpg")),
          Padding(
            padding: const EdgeInsets.only(left: 200.0, top: 100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    // style: style,
                    onPressed: () {},
                    child: Container(width: 1, height: 1),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
