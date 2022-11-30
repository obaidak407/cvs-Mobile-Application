import 'package:cvs_mobile_application/create_acount.dart';
import 'package:cvs_mobile_application/driver_screen.dart';
import 'package:cvs_mobile_application/email_verification.dart';
import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:cvs_mobile_application/mapscreen.dart';
import 'package:cvs_mobile_application/selectuserrole.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:cvs_mobile_application/terns_condition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CVS Mobile Apllication",
      home: loginScreen(),
      initialRoute: loginScreen.idScreen,
      routes: {loginScreen.idScreen: (context) => loginScreen()},
    );
  }
}
