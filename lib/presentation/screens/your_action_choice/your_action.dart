import 'package:courier_appl/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YourActionPage extends StatefulWidget {
  const YourActionPage({Key? key}) : super(key: key);

  @override
  _YourActionPageState createState() => _YourActionPageState();
}

class _YourActionPageState extends State<YourActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 177.0,
              decoration: const BoxDecoration(
                color: AppColors.kbackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Ваше действие',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
              height: MediaQuery.of(context).size.height * 0.2,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                BoxShadow(
                  color: AppColors.kshadow,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
              ),
              child: Center(
                child: Column(
                   
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Дверь открыта',style: TextStyle(color: Color(0xFF008000),fontSize: 17),),
                    Icon(FontAwesomeIcons.doorOpen,size: 44,color: Color(0xFF008000),),
                    Text('Пожалуйста, не забудьте закрыть дверь',style: TextStyle(color: Color(0xFF952323),fontSize: 13),),
                  ],
                ),
              ),
            ),
            Container(
                 margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 319),
                  height: MediaQuery.of(context).size.height * 0.1,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                BoxShadow(
                  color: AppColors.kshadow,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
              ),
              child: const Center(
                child: Text(' Возьмите то что хотите взять',style: TextStyle(color: Color(0xFFA6AAB4),fontSize: 15),)),
            )
            
          ],
        ),
      ),
    );
  }
}
