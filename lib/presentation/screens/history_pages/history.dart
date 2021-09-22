import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/presentation/screens/history_pages/history_page.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'history_product_screen.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool _isselected = true;
  final List<IconData> iconList = [Icons.home, Icons.person];
  final List pages = [const List_shops_map(), const ProfilePage()];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBar(
          context,_bottomNavIndex ==0 ?
          'История':'Профиль',
          _bottomNavIndex == 0 ?
          const Icon(
            FontAwesomeIcons.times,
          ): const Icon(Icons.arrow_back_ios)),
      body: _isselected ? const HistoryPage() : pages[_bottomNavIndex],
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? floatinActionButton(context)
          : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          activeColor: AppColors.kActiveColor,
          inactiveColor: AppColors.kInActiveColor,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              _isselected = !_isselected;
            });
          }),
    );
  }
}
