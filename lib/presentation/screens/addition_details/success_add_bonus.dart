import 'package:courier_appl/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBonus extends StatefulWidget {
  const AddBonus({ Key? key }) : super(key: key);

  @override
  _AddBonusState createState() => _AddBonusState();
}

class _AddBonusState extends State<AddBonus> {
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
                'Успешно добавлен',
                style: TextStyle(
                    color: Color(
                      0xFF008000,
                    ),
                    fontSize: 25.0),
              ),
            
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Icon(
                  FontAwesomeIcons.checkCircle,
                  size: 149,
                  color: Color(0xFF008000),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Добавлен товар на сумму',
                  style: TextStyle(
                      color: Color(
                        0xFF008000,
                      ),
                      fontSize: 25.0),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.044,
                margin: const EdgeInsets.symmetric(horizontal: 154,vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFF596273),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  '390 тг',
                  style: TextStyle(color: Color(0xFF495D8F), fontSize: 19.0),
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
                    'Посмотреть историю',
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