import 'package:courier_appl/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YourChoicePage extends StatefulWidget {
  const YourChoicePage({ Key? key }) : super(key: key);

  @override
  _YourChoicePageState createState() => _YourChoicePageState();
}

class _YourChoicePageState extends State<YourChoicePage> {
  
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
            SingleChildScrollView(
              child: Container(
                 margin: const EdgeInsets.symmetric( vertical: 280),
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Container(
              
             margin: const EdgeInsets.only(
               top:13,
             ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow:  [
                BoxShadow(
                  color: AppColors.kshadow,
                  blurRadius: 3,
                  
                  offset: const Offset(0, 3),
                ),
              ],
              ),
              
             
             child: Card(
               child: Padding(
                 padding: const EdgeInsets.all(10),
                 child: Center(
                   child: Row(
                     children: [
                       const Image(image: AssetImage('assets/img/bottle.png') ),
                       Expanded(child: Column(
                         children:  const[
                           Card(
                             color: Color(0xFFEFF2F7),
                             child: ListTile(
                               title: Text('Название'),
                               trailing: Text('Asu 0.5l'),
                             ),
                           ),
                            Card(
                             color: Color(0xFFEFF2F7),
                             child: ListTile(
                               title: Text('Название'),
                               trailing: Text('Asu 0.5l'),
                             ),
                           ),
                            Card(
                             color: Color(0xFFEFF2F7),
                             child: ListTile(
                               title: Text('Название'),
                               trailing: Text('Asu 0.5l'),
                             ),
                           )
                         ],
                       )
                       )
                     ],
                   ),
                 ),
               ),
             ),
            ),
                      );
                    },
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 _buildInfoConatiner({
    required String text,
    required String title,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffEFF2F7),
       
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            // Spacer(),
            const SizedBox(
              width: 150,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

