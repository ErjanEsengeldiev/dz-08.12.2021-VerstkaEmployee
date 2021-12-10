import 'dart:async';
import 'package:flutter/material.dart';
import 'package:urok_08_12_2021/main.dart';


//Скрин для Ожидания загрузки
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => const FirstScrean())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Atambaev.jpeg',
              height: 100,
            ),
            const SizedBox(height: 30),
            const Text(
              'Wait', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}