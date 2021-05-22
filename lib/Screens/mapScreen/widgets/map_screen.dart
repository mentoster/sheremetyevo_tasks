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
    return InteractiveViewer(
      maxScale: 15,
      minScale: 1,
      child: Container(
        child: Center(
          child: Stack(children: [
            Image(image: AssetImage("assets/images/shema1opt.jpg")),
            Positioned(
                top: 137,
                left: 40,
                child: Transform.scale(scale: 0.09, child: WayButton())),
            Positioned(
                top: 137,
                left: 40,
                child: Transform.scale(scale: 0.09, child: WayButton())),
            Positioned(
                top: 153,
                left: 40,
                child: Transform.scale(scale: 0.09, child: WayButton()))
          ]),
        ),
      ),
    );
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
      return const Color(0x3D4400FF);
    }
    return const Color(0xC4B90000);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        shadowColor: MaterialStateProperty.resolveWith(getColor),
        backgroundColor: MaterialStateProperty.resolveWith(getColor));
    return ElevatedButton(
      style: style,
      onPressed: () {},
      child: Container(
        width: 425,
        height: 1,
      ),
    );
  }
}
