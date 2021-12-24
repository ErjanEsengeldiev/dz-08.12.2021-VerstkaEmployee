import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'employee_page.dart';

//Для создания Сотрудника
class EmployeeCreat extends StatelessWidget {
  int indexOfThisEmployee;
  String roudToImage;
  String name;
  String serName;
  String fathersName;
  String positionInCompany;
  String direction;
  String department;
  String email;
  String berthday;
  String phoneMain;
  String phoneWork;
  String phoneWhatsApp;

  EmployeeCreat({
    required this.indexOfThisEmployee,
    required this.roudToImage,
    required this.name,
    required this.serName,
    required this.fathersName,
    required this.positionInCompany,
    required this.direction,
    required this.department,
    required this.email,
    required this.berthday,
    required this.phoneMain,
    required this.phoneWork,
    required this.phoneWhatsApp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(
            roudToImage,
          ),
        ),
      ),
    );
  }
}

//Вкладка поиска
class SrechWidget extends StatelessWidget {
  const SrechWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 232, 232, 1),
          borderRadius: BorderRadius.circular(10)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Icon(Icons.search, size: 25),
            hintText: 'Поиск',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border: OutlineInputBorder()),
      ),
    );
  }
}

//Text Сотрудники
class TextCollegs extends StatelessWidget {
  const TextCollegs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Сотрудники',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

//Widget для списка "Все Сотрудники"
class Employee extends StatelessWidget {
  int indexFromListOfEmployee;
  Employee({
    required this.indexFromListOfEmployee,
    Key? key,
  }) : super(key: key);

  _callNumber() async {
    await FlutterPhoneDirectCaller.callNumber('+9960706096906');
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return  Wrap(
            children: <Widget>[
               ListTile(
                  leading:  Icon(Icons.phone),
                  title:  Text(
                      'Позвонить ${listOfEmployee[indexFromListOfEmployee].phoneMain}'),
                  onTap: _callNumber),
               ListTile(
                leading:  const Icon(Icons.message),
                title:  const Text('СМС'),
                onTap: () => {},
              ),
               ListTile(
                leading:  const Icon(Icons.message),
                title:  const Text('СМС'),
                onTap: () => {},
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeePager(
                              indexForTakeEmployeeIndex:
                                  indexFromListOfEmployee,
                            )));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        listOfEmployee[indexFromListOfEmployee].roudToImage),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '${listOfEmployee[indexFromListOfEmployee].name} ${listOfEmployee[indexFromListOfEmployee].serName}\n${listOfEmployee[indexFromListOfEmployee].fathersName}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _settingModalBottomSheet(context);
              },
              child: Icon(
                Icons.phone,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Пункт "Все Сотрудники"
class AallEmloyeeWidgetForMain extends StatelessWidget {
  const AallEmloyeeWidgetForMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Все Сотрудники',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Employee(
            indexFromListOfEmployee: 0,
          ),
          Employee(
            indexFromListOfEmployee: 1,
          ),
          Employee(
            indexFromListOfEmployee: 2,
          ),
          Employee(
            indexFromListOfEmployee: 3,
          ),
          Employee(
            indexFromListOfEmployee: 4,
          ),
          Employee(
            indexFromListOfEmployee: 5,
          ),
        ],
      ),
    );
  }
}

//Спиок работников у кого сегодня денб рождения
List<EmployeeCreat> todayBerthadayListOfEmployee = [];

//Спиок работников у кого завтра день рождени
List<EmployeeCreat> tomorowBerthadayListOfEmployee = [];

//Список всех работников
List<EmployeeCreat> listOfEmployee = [
  EmployeeCreat(
      indexOfThisEmployee: 0,
      roudToImage: 'assets/images/Ellipse 28 (1).png',
      name: 'Мырзабек',
      serName: 'Жапыркулов',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '16.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 1,
      roudToImage: 'assets/images/Atambaev.jpeg',
      name: 'Алмазбек',
      serName: 'Атамбаев',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '17.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 2,
      roudToImage: 'assets/images/images (1).jpeg',
      name: 'Депутат',
      serName: 'Непонятный',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '17.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 3,
      roudToImage: 'assets/images/images.jpeg',
      name: 'Садыр',
      serName: 'Жапаров',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '16.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 4,
      roudToImage: '',
      name: 'Мырзабек',
      serName: 'Жапыркулов',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '1.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 5,
      roudToImage: '',
      name: 'Мырзабек',
      serName: 'Жапыркулов',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '16.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 6,
      roudToImage: '',
      name: 'Мырзабек',
      serName: 'Жапыркулов',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '16.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),
  EmployeeCreat(
      indexOfThisEmployee: 7,
      roudToImage: '',
      name: 'Мырзабек',
      serName: 'Жапыркулов',
      fathersName: 'Жапыркулович',
      positionInCompany: 'Генеральный директор',
      direction: 'Дирекция управления',
      department: 'Отдел управления',
      email: 'mjagarkulov@gosecotech.kg',
      berthday: '16.09.1972',
      phoneMain: '+9965501234321',
      phoneWork: '+9965501234321',
      phoneWhatsApp: '+9965501234321'),

      
];
