import 'package:flutter/material.dart';

class ChooseCharacter extends StatelessWidget {
  final Function nextPage;
  final Function(bool) changeCharacter;
  const ChooseCharacter(this.nextPage, this.changeCharacter);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Я...", style: TextStyle(fontSize: 108, color: Colors.black)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                nextPage();
                changeCharacter(false);
              },
              child: const Text('Инженер'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                nextPage();
                changeCharacter(true);
              },
              child: const Text('Работник'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
