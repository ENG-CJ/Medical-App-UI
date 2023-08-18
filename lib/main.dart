import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/pages/appointment.dart';
import 'package:medical_app/pages/home.dart';
import 'package:medical_app/pages/schedule.dart';

import 'constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: colors['primary'] as Color,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        primaryColor: const Color(0xff7165d7)
      ),
      home:  Home(),
    );
  }
}


