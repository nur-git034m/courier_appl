import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCreate extends StatefulWidget {
  const QrCreate({Key? key}) : super(key: key);

  @override
  _QrCreateState createState() => _QrCreateState();
}

class _QrCreateState extends State<QrCreate> {
  final controller = TextEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: controller.toString(),
              size: 200,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 40,
            ),
            buildTextField(context),
          ],
        ),
      ),
    );
  }
}

@override
Widget buildTextField(BuildContext context) {
  return TextField(
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: const TextStyle(color: Colors.grey),
        suffix: IconButton(
            onPressed: () {},
            color: Colors.redAccent,
            icon: const Icon(
              Icons.done,
              size: 30.0,
            ))),
  );
}
