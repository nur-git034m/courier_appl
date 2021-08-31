import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/presentation/screens/history_page/history_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _number = '';

  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      color: const Color(0xFFE5E5E5),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Имя',
                    suffix: TextButton(
                        child: Text(
                      'Изменить',
                    )),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Пожалуйста, введите свой имя';
                    }
                    return null;
                  },
                  onChanged: (value) => _name = value,
                ),
                TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Номер',
                    suffix: TextButton(child: Text('Изменить')),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Пожалуйста, введите свой номер';
                    }
                    return null;
                  },
                  onChanged: (value) => _number = value,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: AppColors.kbackground,
            ),
            child: const Text(
              'История добавления товара',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
