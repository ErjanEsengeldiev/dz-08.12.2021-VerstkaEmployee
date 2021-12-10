import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'widgets.dart';
//Для личной странички
class EmployeePager extends StatelessWidget {
  int indexForTakeEmployeeIndex;
  
  EmployeePager({
    required this.indexForTakeEmployeeIndex,
  
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 57,
                backgroundImage: AssetImage(
                    listOfEmployee[indexForTakeEmployeeIndex].roudToImage),
              ),
              Text('${listOfEmployee[indexForTakeEmployeeIndex].serName} ${listOfEmployee[indexForTakeEmployeeIndex].name}'),
              Text('${listOfEmployee[indexForTakeEmployeeIndex].fathersName} '),
              Text(
                listOfEmployee[indexForTakeEmployeeIndex].positionInCompany,
                style: TextStyle(color: Colors.blue),
              ),
              InfoColum(info: 'Направление', title:listOfEmployee[indexForTakeEmployeeIndex].direction),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Отдел', title: listOfEmployee[indexForTakeEmployeeIndex].department),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Email', title: listOfEmployee[indexForTakeEmployeeIndex].email),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Дата Рождения', title: listOfEmployee[indexForTakeEmployeeIndex].berthday),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Основной номер телефона', title: listOfEmployee[indexForTakeEmployeeIndex].phoneMain),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Рабочий номер телефона', title: listOfEmployee[indexForTakeEmployeeIndex].phoneWork),
              Divider(
                thickness: 0.5,
              ),
              InfoColum(info: 'Номер WhatsApp', title: listOfEmployee[indexForTakeEmployeeIndex].phoneWhatsApp),
              Divider(
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoColum extends StatelessWidget {
  String title;
  String info;
  InfoColum({
    required this.info,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            info,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
