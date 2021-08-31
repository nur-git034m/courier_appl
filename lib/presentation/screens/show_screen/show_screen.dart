import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key key}) : super(key: key);

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  final List<IconData> iconList = [Icons.home, Icons.person];

  int _bottomNavIndex = 0;
  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Витрина'),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(
                top: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/img/bottle.png'),
                  ),
                  Column(
                    children: [
                      _buildInfoConatiner(
                          title: 'Название', text: 'ASU 0.5L  '),
                      _buildInfoConatiner(title: 'Количество', text: '10 шт  '),
                      _buildInfoConatiner(title: 'Цена', text: '150 тг '),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: floatinActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: AppColors.kActiveColor,
        inactiveColor: AppColors.kInActiveColor,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  _buildInfoConatiner({
    String text,
    String title,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffEFF2F7),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            // Spacer(),
            const SizedBox(
              width: 150,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
