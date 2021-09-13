import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/data/services/history_list_services.dart';
import 'package:courier_appl/models/History_list.dart';
import 'package:courier_appl/presentation/screens/history_product_page/history_product_screen.dart';

import 'package:intl/intl.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<History> historyInfo;
  @override
  void initState() {
    // TODO: implement initState
    historyInfo = History_list_Service().getListofHistory();
  }

  final List<bool> _selections = List.generate(2, (index) => false);

  final List<IconData> iconList = [Icons.home, Icons.person];
  final List pages = [const List_shops_map(), const ProfilePage()];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context,
          'История',
          const Icon(
            Icons.arrow_back_ios,
          )),
      body: FutureBuilder<History>(
        future: historyInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var date = DateFormat('dd.MM.yyyy').format(DateTime.parse(snapshot.data!.data[index].createdAt));
                      return Column(
                        children: [
                          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                           Text(date,textAlign:TextAlign.center,
                           style: const TextStyle(color: Color(0xFF613EEA),fontSize: 15),),
                          Card(
                            
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                 
                                  Image.asset(
                                    'assets/img/fredg.png',
                                    fit: BoxFit.fitWidth,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.height *
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
                                      builder: (context) => const HistoryOfProducts ()));
                                        },
                                        title: Text(
                                          snapshot.data!.data[index].address,
                                          style: const TextStyle(
                                              color: AppColors.kShowTextColor,
                                              fontSize: 18.0),
                                        ),
                                        subtitle: Text(
                                          snapshot.data!.data[index].price,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF613EEA),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
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
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
