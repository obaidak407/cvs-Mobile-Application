import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:flutter/material.dart';

class SelectUserRole extends StatelessWidget {
  const SelectUserRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage('assets/images/topbar.png')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please Select',
                    style: TextStyle(
                      fontFamily: 'Avenir Roman',
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Your',
                        style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        ' Role',
                        style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Before regsitration we need to find out your role.',
                    style: TextStyle(
                      fontFamily: 'Avenir Book',
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Register as',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, loginScreen.idScreen, (route) => false);
                      },
                      child: Ink.image(
                        image: AssetImage('assets/images/driver.png'),
                        height: 100,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Ink.image(
                        image: AssetImage('assets/images/driver.png'),
                        height: 100,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account? ",
                        style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
