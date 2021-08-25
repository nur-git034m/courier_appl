

import 'package:flutter/material.dart';

import 'presentation/screens/auth_screen/auth_screend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:AuthScreen(),
    );
  }
}
