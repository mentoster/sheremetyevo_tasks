import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/way_map.dart';

const users = const {
  'user@ya.ru': '1234',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2150);

  Future<String> _authUser(LoginData data) {
    print('Имя: ${data.name}, Пароль: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Пользователя не существует';
      }
      if (users[data.name] != data.password) {
        return 'Неверный пароль!';
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Имя: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Пользователя не существует';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      messages: LoginMessages(
          usernameHint: 'Имя',
          passwordHint: 'Пароль',
          confirmPasswordHint: 'Подтвердить',
          loginButton: 'Войти',
          signupButton: 'Регистрация',
          forgotPasswordButton: 'Забыли пароль?',
          recoverPasswordButton: 'ПОМОГИТЕ',
          goBackButton: 'ВЕРНУТЬСЯ',
          confirmPasswordError: 'Не подходит!',
          recoverPasswordDescription: 'Введите свою почту',
          recoverPasswordSuccess: 'Пароль успешно изменен',
          flushbarTitleError: "Ошибка"),
      title: 'Задачи',
      // logo: 'assets/images/ecorp-lightblue.png',
      // emailValidator: (value) => "Неверное имя!",
      // passwordValidator: (value) => "Неверный пароль!",
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => WayMap(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
