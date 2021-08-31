import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';

import 'package:courier_appl/data/services/Items.dart';
import 'package:courier_appl/presentation/screens/map_screen/map_screen.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:courier_appl/presentation/screens/show_screen/show_screen.dart';
import 'package:flutter/material.dart';

class List_shops_map extends StatefulWidget {
  const List_shops_map({Key key}) : super(key: key);

  @override
  State<List_shops_map> createState() => _List_shops_mapState();
}

class _List_shops_mapState extends State<List_shops_map> {
  bool selectedColor = true;

 

  int _bottomNavIndex = 0;
  List<Items> locations = [
    Items(
      location: 'N8 мкр.25',
      img: 'fredg.png',
      subLocation: 'Абая ,Алтынсарин пр',
    ),
    Items(
        location: 'N8 мкр.25',
        img: 'fredg.png',
        subLocation: 'Абая ,Алтынсарин пр'),
    Items(
        location: 'N8 мкр.25',
        img: 'fredg.png',
        subLocation: 'Абая ,Алтынсарин пр'),
    Items(
        location: 'N8 мкр.25',
        img: 'fredg.png',
        subLocation: 'Абая ,Алтынсарин пр'),
    Items(
        location: 'N8 мкр.25',
        img: 'fredg.png',
        subLocation: 'Абая ,Алтынсарин пр'),
    Items(
        location: 'N8 мкр.25',
        img: 'fredg.png',
        subLocation: 'Абая ,Алтынсарин пр'),
  ];

  final List<bool> _selections = List.generate(2, (index) => false);

  List<bool> _selectedBotton = [true, false];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: Column(
        children: [
          Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 24),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.kTextColor,
                    fillColor: AppColors.kbackground,
                    selectedColor: Colors.white,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Text('Список '),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Text(' На карте'),
                      ),
                    ],
                    isSelected: _selectedBotton,
                    onPressed: (int index) {
                      setState(
                        () {
                          for (int i = 0; i < _selectedBotton.length; i++) {
                            _selectedBotton[i] = i == index;
                          }
                        },
                      );
                    },
                  ))
          ,
          _selectedBotton[0]
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 4.0),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ShowScreen()),
                                );
                              },
                              title: Text(
                                locations[index].location,
                                style: const TextStyle(
                                    color: AppColors.kShowTextColor,
                                    fontSize: 18.0),
                              ),
                              subtitle: Text(
                                locations[index].subLocation,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                              leading: Image(
                                image: AssetImage(
                                    'assets/img/${locations[index].img}'),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : const MapScreen(),
        ],
      ) ,
     
    );
  }
}
