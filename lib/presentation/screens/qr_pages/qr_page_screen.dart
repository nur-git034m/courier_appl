import 'dart:developer';
import 'dart:io';

import 'package:courier_appl/presentation/screens/addition_details/success_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_dot/pin_dot.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrPageScreen extends StatefulWidget {
  const QrPageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrPageScreenState();
}

class _QrPageScreenState extends State<QrPageScreen> {
  final String pin_code = '123456';

  final textEditingController = TextEditingController();

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xFFA6AAB4),
              indicatorColor: Color(0xFF613EEA),
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(
                  text: "QR scanner",
                ),
                Tab(
                  text: "Code from Screen",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: _buildQrView(context),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          pinTheme: PinTheme(
                            activeColor: Colors.green,
                            inactiveColor: const Color(0xFF613EEA),
                            activeFillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                          onCompleted: (value) {
                            if (value == pin_code) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SuccessAdd()));
                            } 
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:15 ,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Text('Ввести код который отоброжен на холодильнике ',
                     textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      
                    ),),
                  ),
                  const SizedBox(height: 40,),
                  IconButton(
            icon: const Icon(FontAwesomeIcons.times),
            onPressed: () {},
            color: const Color(0xFF613EEA),
            iconSize: 34,
          )
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Scaffold(
        body: Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderLength: 20,
              borderWidth: 10,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Container(
          padding: const EdgeInsets.only(top: 320, left: 50, right: 50),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                ),
                IconButton(
                    iconSize: 35,
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: const Icon(Icons.flash_off)),
              ],
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 390),
            child: const Center(
                child: Text(
              'Введите камеру на QR code',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 21,
              ),
            ))),
        Container(
          padding: const EdgeInsets.only(top: 510),
          child: Center(
              child: IconButton(
            icon: const Icon(FontAwesomeIcons.times),
            onPressed: () {},
            color: const Color(0xFF613EEA),
            iconSize: 34,
          )),
        ),
      ],
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
