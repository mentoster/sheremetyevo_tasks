import 'package:flutter/material.dart';

class ChooseType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Мой \nкласс...",
              style: TextStyle(fontSize: 108, color: Colors.black)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TypeButton("грузовик/самосвал"),
              TypeButton("экскаватор (погрузка снега)"),
              TypeButton("роторный погрузчик"),
              TypeButton("плужно-щеточная машина"),
              TypeButton(" плужно-щеточная машина с реагентом"),
            ],
          ),
        ],
      ),
    );
  }
}

class TypeButton extends StatelessWidget {
  final String buttonText;
  TypeButton(this.buttonText);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
