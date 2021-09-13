import 'package:courier_appl/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FailedSuccess extends StatefulWidget {
  const FailedSuccess({ Key? key }) : super(key: key);

  @override
  _FailedSuccessState createState() => _FailedSuccessState();
}

class _FailedSuccessState extends State<FailedSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context,
          'Детали добавления',
          const Icon(
            FontAwesomeIcons.times,
          )),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              const Text(
                'Не достаточно средств',
                style: TextStyle(
                    color: Color(
                      0xFF952323,
                    ),
                    fontSize: 25.0),
              ),
            
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Icon(
                  FontAwesomeIcons.checkCircle,
                  size: 149,
                  color: Color(0xFF952323),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Пополните карту для новой покупки',
                  style: TextStyle(
                      color: Color(
                        0xFF952323,
                      ),
                      fontSize: 25.0),
                ),
              ),
              
              const Spacer(
                flex: 11,
              ),
              ElevatedButton(
                style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(const Color(0xFF47536D)),
                ),
                onPressed: () {  },
                child: const Text(
                    'На главную',
                    style: TextStyle(color: Colors.white, fontSize: 19.0),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}