import 'package:flutter/material.dart';
import 'package:urok_08_12_2021/splash_screen.dart';
import 'package:urok_08_12_2021/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Фукнция что бы проверить у кого сегодня др
    void todayBerthFunc() {
      if (todayBerthadayListOfEmployee.isEmpty) {
        for (int i = 0; i < listOfEmployee.length; i++) {
          if (listOfEmployee[i].berthday == '16.09.1972') {
            todayBerthadayListOfEmployee.add(listOfEmployee[i]);
          }
        }
      }
    }

    //Фукнция что бы проверить у кого завтра др
    void tomorowBerthFunc() {
      if (tomorowBerthadayListOfEmployee.isEmpty) {
        for (int i = 0; i < listOfEmployee.length; i++) {
          if (listOfEmployee[i].berthday == '17.09.1972') {
            tomorowBerthadayListOfEmployee.add(listOfEmployee[i]);
          }
        }
      }
    }

    tomorowBerthFunc();
    todayBerthFunc();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class FirstScrean extends StatefulWidget {
  const FirstScrean({Key? key}) : super(key: key);

  @override
  _FirstScreanState createState() => _FirstScreanState();
}

class _FirstScreanState extends State<FirstScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Сотрудники
                const TextCollegs(),
                //Поиск
                const SrechWidget(),
                //У Кого сегодня день рождения
                BerthdayToday(),
                //У Кого Завтра день рождения
                const BerthdayTomorow(),

                const AallEmloyeeWidgetForMain()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
