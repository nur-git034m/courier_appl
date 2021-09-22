import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/data/services/user_service.dart';
import 'package:courier_appl/models/User.dart';
import 'package:courier_appl/presentation/screens/history_pages/history.dart';
import 'package:courier_appl/presentation/screens/history_pages/history_page.dart';
import 'package:courier_appl/presentation/screens/home_page/home_page.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<IconData> iconList = [Icons.home, Icons.person];

  final formKey = GlobalKey<FormState>();
  int _bottomNavIndex = 0;

  final _numberController = TextEditingController();

  final _nameController = TextEditingController();

  late Future<User> userInfo;

  @override
  void initState() {
    // TODO: implement initState
    userInfo = UserService().ProfileNameAndPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: userInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error');
          } else if (snapshot.hasData) {
            _nameController.text = snapshot.data!.data.name;
            _numberController.text = snapshot.data!.data.phone;
          }
          return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            color: const Color(0xFFE5E5E5),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 22, right: 24, bottom: 21),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Имя'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: InputBorder.none,
                                suffix: TextButton(
                                  child: const Text('изменить'),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                )),
                            onEditingComplete: () {
                              UserService().ChangeNameAndPhone(
                                  _nameController.text, _numberController.text);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Номер'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _numberController,
                            decoration: const InputDecoration(
                              fillColor: Colors.red,
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.135,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: AppColors.kbackground,
                    ),
                    child: const Text(
                      'История добавления товара',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const History()),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
