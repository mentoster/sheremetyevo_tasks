import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WayMap extends StatelessWidget {
  final BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        backdropEnabled: true,
        panel: Center(
          child: Text("inside"),
        ),
        collapsed: Column(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            Container(
              // color: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  "Задание",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        body: Text("Map"),
        borderRadius: radius,
      ),
    );
  }
}
