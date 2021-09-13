// @dart=2.9
import 'package:courier_appl/models/history_productsList.dart';
import 'package:courier_appl/presentation/screens/auth_screen/auth_screend.dart';
import 'package:courier_appl/presentation/screens/history_product_page/history_product_screen.dart';
import 'package:courier_appl/presentation/screens/home_page/home_page.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:courier_appl/presentation/screens/qr_pages/qr_page_screen.dart';
import 'package:courier_appl/presentation/screens/show_screen/show_screen.dart';

import 'package:flutter/material.dart';


import 'presentation/screens/history_page/history_page.dart';
import 'presentation/screens/qr_pages/qr_create_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  HistoryOfProducts());
      // Homepage() );
  }
}

// 77088191479
// password
// qwerty123