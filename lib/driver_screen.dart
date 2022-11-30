import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cvs_mobile_application/terns_condition.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage('assets/images/backarrow.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                    fontSize: 32,
                    fontFamily: "Avenir Roman",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Verification",
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.none,
                    fontSize: 32,
                    fontFamily: "Avenir Roman",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please attached the following docs.',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Avenir Book',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Material(
                  color: Color(0xfff7f4f8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff2b9348),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image:
                                AssetImage("assets/images/driver_license.png"),
                            height: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Driver License',
                            style: TextStyle(
                              fontFamily: 'Avenir Book',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                " Upload",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Avenir Book',
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Material(
                  color: Color(0xfff7f4f8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff2b9348),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/form.png"),
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '1099 Form',
                            style: TextStyle(
                              fontFamily: 'Avenir Book',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                " Upload",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Avenir Book',
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage("assets/images/step_second.png"),
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Terms_Condition()));
                  },
                  child: Image(
                    image: AssetImage("assets/images/small_next.png"),
                    height: 60,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
