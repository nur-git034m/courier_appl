// @dart=2.9
import 'package:courier_appl/models/history_details.dart';

import 'package:courier_appl/presentation/screens/auth_screen/auth_screend.dart';

import 'package:courier_appl/presentation/screens/home_page/home_page.dart';
import 'package:courier_appl/presentation/screens/list_shop_map/list_shops_map.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:courier_appl/presentation/screens/qr_pages/qr_page_screen.dart';
import 'package:courier_appl/presentation/screens/show_screen/show_screen.dart';
import 'package:courier_appl/presentation/screens/your_action_choice/your_choice.dart';


import 'package:flutter/material.dart';
import 'package:flutter_pusher/pusher.dart';


import 'presentation/screens/addition_details/success_add.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  AuthScreen());
    
  }
}

// 77088191479
// password
// qwerty123


//12345678
//77077077777