import 'package:flutter/material.dart';

class ChooseType extends StatelessWidget {
  final Function nextPage;
  final Function changeClass;
  ChooseType(this.nextPage, this.changeClass);
  void _chooseClass(String type) {
    nextPage();
    changeClass(type);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Мой \nкласс...",
              style: TextStyle(fontSize: 108, color: Colors.black)),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TypeButton("грузовик/самосвал", _chooseClass),
                TypeButton("экскаватор (погрузка снега)", _chooseClass),
                TypeButton("роторный погрузчик", _chooseClass),
                TypeButton("плужно-щеточная машина", _chooseClass),
                TypeButton(" плужно-щеточная машина ,_chooseClassс реагентом",
                    _chooseClass),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TypeButton extends StatelessWidget {
  final String buttonText;
  final Function changeClass;
  TypeButton(this.buttonText, this.changeClass);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () => changeClass(buttonText),
        child: Text(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
