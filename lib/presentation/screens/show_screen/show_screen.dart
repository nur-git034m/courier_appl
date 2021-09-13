import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/data/services/Show_case_service.dart';
import 'package:courier_appl/data/services/list_shops_service.dart';
import 'package:courier_appl/models/Show_case.dart';
import 'package:courier_appl/models/list_shops.dart';
import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  final String id;

  const ShowScreen({Key? key, required this.id}) : super(key: key);
  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  late Future<ShowCase> showCaseInfo;
  @override
  void initState() {
    // TODO: implement initState
    showCaseInfo = ShowCaseService().getShowCase(widget.id);
  }

  final List<IconData> iconList = [Icons.home, Icons.person];

  int _bottomNavIndex = 0;
  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context,
          'Витрина',
          const Icon(
            Icons.arrow_back_ios,
          )),
      body: FutureBuilder<ShowCase>(
        future: showCaseInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kshadow,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Row(
                          children: [
                            Image.network(
                              snapshot.data!.data[index].image,
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width * 0.270,
                              height:
                                  MediaQuery.of(context).size.height * 0.2,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Card(
                                  color: const Color(0xFFEFF2F7),
                                  child: ListTile(
                                    title: const Text('Название'),
                                    trailing: Text(
                                      snapshot.data!.data[index].name,
                                    ),
                                  ),
                                ),
                                Card(
                                  color: const Color(0xFFEFF2F7),
                                  child: ListTile(
                                      title: const Text('Количество'),
                                      trailing: Text(snapshot
                                          .data!.data[index].quantity)),
                                ),
                                Card(
                                  color: const Color(0xFFEFF2F7),
                                  child: ListTile(
                                    title: const Text('Цена'),
                                    trailing: Text(
                                        snapshot.data!.data[index].price),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
}
