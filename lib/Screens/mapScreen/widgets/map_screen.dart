import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double scale = 0.1;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InteractiveViewer(
      maxScale: 15,
      minScale: 1,
      child: Center(
        child: Stack(children: [
          Image(image: AssetImage("assets/images/shema1opt.jpg")),
          Transform.scale(
            scale: scale,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WayButton(),
                WayButton(),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}

class WayButton extends StatelessWidget {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return const Color(0x1C4400FF);
    }
    return const Color(0x05D4DEFF);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor));
    return ElevatedButton(
      style: style,
      onPressed: () {},
      child: Container(width: 1, height: 1),
    );
  }
}
