//У кого сегодня день рождения
import 'package:flutter/material.dart';
import 'package:urok_08_12_2021/employee_page.dart';
import 'package:urok_08_12_2021/widgets.dart';

class BerthdayToday extends StatefulWidget {
  const BerthdayToday({
    Key? key,
  }) : super(key: key);

  @override
  State<BerthdayToday> createState() => _BerthdayTodayState();
}

class _BerthdayTodayState extends State<BerthdayToday> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
         height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'У кого сегодня день рождения',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color.fromRGBO(59, 129, 234, 1),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: todayBerthadayListOfEmployee.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 19),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              todayBerthadayListOfEmployee[index].roudToImage,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Material(
                            child: InkWell(
                              splashColor: Colors.blue,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmployeePager(
                                      indexForTakeEmployeeIndex:
                                          todayBerthadayListOfEmployee[index]
                                              .indexOfThisEmployee,
                                    ),
                                  ),
                                );
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}