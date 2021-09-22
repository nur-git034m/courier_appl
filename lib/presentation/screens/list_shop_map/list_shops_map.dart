import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';

import 'package:courier_appl/data/services/list_shops_service.dart';
import 'package:courier_appl/models/list_shops.dart';
import 'package:courier_appl/presentation/screens/map_screen/map_screen.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:courier_appl/presentation/screens/show_screen/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class List_shops_map extends StatefulWidget {
  const List_shops_map({Key? key}) : super(key: key);

  @override
  State<List_shops_map> createState() => _List_shops_mapState();
}

class _List_shops_mapState extends State<List_shops_map> {

  

  late Future<ListShops> showInfo;
  @override
  void initState() {
    
    showInfo = List_shops_Service().getListofLocations();
  }

  final List<IconData> iconList = [Icons.home, Icons.person];
  bool selectedColor = true;

  int _bottomNavIndex = 0;

  final List<bool> _selections = List.generate(2, (index) => false);

  List<bool> _selectedBotton = [true, false];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
     
      body: FutureBuilder<ListShops>(
        future: showInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                    padding:  EdgeInsets.only( top: screenSize.height * 0.04,
                    ),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.kTextColor,
                      fillColor: AppColors.kbackground,
                      selectedColor: Colors.white,
                      children:  [
                        pad_name_togle_buttons('Список '),
                       pad_name_togle_buttons('На карте'),
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
                    )),
                _selectedBotton[0]
                    ? Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 
                    screenSize.width * 0.05,),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                decoration:  BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: shops_map(context, snapshot, index , snapshot
                                                    .data!.data[index].name, snapshot.data!.data[index]
                                                    .address,),
                              );
                            }),
                      )
                    : const MapScreen(),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
     
    );
  }

  Card shops_map(BuildContext context, AsyncSnapshot<ListShops> snapshot, int index,String titleText,String subTitleText,) {
    return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/img/fredg.png',
                                          fit: BoxFit.fitWidth,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            ListTile(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                            ShowScreen(id: snapshot.data!.data[index].id.toString())),
                                                          
                                                );
                                              },
                                              title: Text(
                                                titleText,
                                               
                                                style: const TextStyle(
                                                    color: AppColors
                                                        .kShowTextColor,
                                                    fontSize: 18.0,fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                subTitleText,
                                                
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0),
                                              ),
                                              trailing: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
  }

  Padding pad_name_togle_buttons(String name_button_togle) {
    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Text(name_button_togle),
                      );
  }
}
