import 'package:courier_appl/presentation/screens/qr_pages/qr_page_screen.dart';
import 'package:flutter/material.dart';

import 'constants_color.dart';

AppBar appBar(BuildContext context, String text, Icon icon) {
  return AppBar(
      toolbarHeight: 90,
      backgroundColor: AppColors.kbackground,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(13.0),
          bottomRight: Radius.circular(13.0),
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      leading: IconButton(
        icon: icon,
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}

FloatingActionButton floatinActionButton(context) {
  return FloatingActionButton(
    backgroundColor: AppColors.kbackground,
    child: const Icon(Icons.qr_code),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const QrPageScreen()));
    },
  );
}
