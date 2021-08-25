import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/presentation/screens/quick_entry/quick_entry.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  String _number = '';

  String _password = '';

  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      print(_number);

      print(_password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuickEntryPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: 361.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: AppColors.kbackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Вход/Регистрация',
                    style:
                        TextStyle(color: AppColors.kTextColor, fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Номер/email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Пожалуйста, введите свой адрес электронной почты';
                      }
                      return null;
                    },
                    onChanged: (value) => _number = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Пароль'),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Это поле является обязательным';
                      }
                      if (value.trim().length < 8) {
                        return 'Длина пароля должна составлять не менее 8 символов';
                      }
                      return null;
                    },
                    onChanged: (value) => _password = value,
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              top: 264,
            ),
            width: 308,
            height: 227,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(13.0),
                bottomRight: Radius.circular(13.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kshadow,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.25,
                top: 465,
                bottom: 17),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: AppColors.kbackground,
              ),
              child: const Text(
                'Отправить',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: _trySubmitForm,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.35,
              top: 498,
            ),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(color: AppColors.kTextColor),
                )),
          ),
        ]),
      ),
    );
  }
}
