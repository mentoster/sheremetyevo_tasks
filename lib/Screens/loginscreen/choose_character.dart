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
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Я...", style: TextStyle(fontSize: 108, color: Colors.black)),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      nextPage();
                      changeCharacter(true);
                    },
                    child: const Text(
                      'Инженер',
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      nextPage();
                      changeCharacter(false);
                    },
                    child: const Text(
                      'Работник',
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
