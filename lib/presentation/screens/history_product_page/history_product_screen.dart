import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/data/services/history_porducts.dart';
import 'package:courier_appl/models/history_productsList.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:flutter/material.dart';

class HistoryOfProducts extends StatefulWidget {
  const HistoryOfProducts({Key? key}) : super(key: key);

  @override
  _HistoryOfProductsState createState() => _HistoryOfProductsState();
}

class _HistoryOfProductsState extends State<HistoryOfProducts> {
  late Future<HistoryProducts> historyProductInfo;
  @override
  void initState() {
    // TODO: implement initState
    historyProductInfo = History_Product_Service().getHistoryofProducts();
  }

  final List<IconData> iconList = [Icons.home, Icons.person];
  final List pages = [const List_shops_map(), const ProfilePage()];
  int _bottomNavIndex = 0;

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context,
          'История',
          const Icon(
            Icons.arrow_back_ios,
          )),
      body: FutureBuilder<HistoryProducts>(
        future: historyProductInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Container(
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(snapshot.data!.data.date,
                                style: const TextStyle(fontSize: 14)),
                            Text(snapshot.data!.data.time,
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        color: Colors.white,
                        child: ListTile(
                          title: const Text('Номер покупки',style: TextStyle(fontSize: 17)),
                          trailing: Text(
                            snapshot.data!.data.id.toString(),style: const TextStyle(fontSize: 17)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        color: Colors.white,
                        child: ListTile(
                          title: const Text('Местоположение',style: TextStyle(fontSize: 17)),
                          trailing: Text(
                            snapshot.data!.data.address,
                            style: const TextStyle(fontSize: 17)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF47536D),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kshadow,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Итоговая сумма',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text(snapshot.data!.data.total,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.469,
                  child: ListView.builder(
                    itemCount: snapshot.data!.data.details.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
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
                                      snapshot.data!.data.details[index].image,
                                      fit: BoxFit.fitWidth,
                                      width: MediaQuery.of(context).size.width *
                                          0.320,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Card(
                                          color: const Color(0xFFEFF2F7),
                                          child: ListTile(
                                            title: const Text('Название'),
                                            trailing: Text(
                                              snapshot.data!.data.details[index]
                                                  .name,
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: const Color(0xFFEFF2F7),
                                          child: ListTile(
                                            title: const Text('Количество'),
                                            trailing: Text(
                                              snapshot.data!.data.details[index]
                                                  .quantity,
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: const Color(0xFFEFF2F7),
                                          child: ListTile(
                                            title: const Text('Цена'),
                                            trailing: Text(
                                              snapshot.data!.data.details[index]
                                                  .price,
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: const Color(0xFFEFF2F7),
                                          child: ListTile(
                                            title: const Text('Cумма'),
                                            trailing: Text(
                                              snapshot.data!.data.details[index]
                                                  .sum,
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
