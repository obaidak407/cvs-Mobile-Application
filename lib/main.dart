import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CVS Mobile Apllication",
      home: SplashScreen(),
      routes: {loginScreen.idScreen: (context) => loginScreen()},
    );
  }
}
