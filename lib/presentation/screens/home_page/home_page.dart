import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Homepage> {
  final List<IconData> iconList = [Icons.home, Icons.person];
  final List pages = [List_shops_map(), ProfilePage()];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, _bottomNavIndex == 0 ? '7Food на карте': 'Профиль'),
      body: pages[_bottomNavIndex],
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom==0
      ? floatinActionButton(context)
      : SizedBox(),
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
}
