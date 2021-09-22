import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:courier_appl/constants/constants_color.dart';
import 'package:courier_appl/constants/widgets.dart';
import 'package:courier_appl/data/services/history/history_list_services.dart';
import 'package:courier_appl/models/History_list.dart';
import 'package:courier_appl/presentation/screens/history_pages/history_product_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<History>(
        future: historyInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.02,
              ),
              child: ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var date = DateFormat('dd.MM.yyyy').format(
                        DateTime.parse(snapshot.data!.data[index].createdAt));
                    return Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenSize.width * 0.009)),
                        Text(
                          date,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF613EEA), fontSize: 15),
                        ),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    ListHistory(
                                      context,
                                      snapshot,
                                      index,
                                      snapshot.data!.data[index].address,
                                      snapshot.data!.data[index].price,
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

  ListTile ListHistory(BuildContext context, AsyncSnapshot<History> snapshot,
      int index, String title, String subtitle) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HistoryOfProducts(snapshot.data!.data[index].id)));
      },
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.kShowTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF613EEA),
      ),
    );
  }
}
