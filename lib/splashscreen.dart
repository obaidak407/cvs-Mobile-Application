import 'dart:async';

import 'package:cvs_mobile_application/mapscreen.dart';
import 'package:cvs_mobile_application/selectuserrole.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MapScreeen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox.fromSize(size: Size.fromHeight(30)),
        Container(
          child: Center(
            child: Image(
              image: AssetImage('assets/images/recycle.png'),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                Text(
                  '© Cash Vs Scrap 2023, All Right Reserves',
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Developed By RippleBerry Tech.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ))
      ],
    ));
  }
}
