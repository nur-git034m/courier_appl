import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  final List<IconData> iconList = [Icons.home, Icons.people];

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
            backgroundColor: AppColors.kbackground,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(13.0),
                bottomRight: Radius.circular(13.0),
              ),
            ),
            title: const Text(
              '7Food на карте',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kbackground,
        child: const Icon(Icons.qr_code),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        
        icons: iconList,
        activeIndex: _bottomNavIndex,
        
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
