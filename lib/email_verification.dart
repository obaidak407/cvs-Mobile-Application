import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Email_Verification extends StatelessWidget {
  const Email_Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: 'Avenir Roman',
                        fontSize: 32,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 17.0,
              ),
              Row(
                children: [
                  SizedBox(height: 17.0),
                  Text(
                    "Verification",
                    style: TextStyle(
                        fontFamily: 'Avenir Roman',
                        fontSize: 32,
                        color: Color.fromRGBO(43, 147, 72, 1)),
                  )
                ],
              ),
              SizedBox(
                height: 17.0,
              ),
              Row(
                children: [
                  Text(
                    "A verification code has been sent on",
                    style: TextStyle(fontSize: 18, fontFamily: "Avenir Roman"),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text(
                    "your email",
                    style: TextStyle(fontSize: 18, fontFamily: "Avenir Roman"),
                  ),
                  Text(
                    " saad@ahmedgraf.com",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Avenir Roman",
                        color: Color.fromRGBO(43, 147, 72, 1)),
                  )
                ],
              ),
              //Addd Field Boxes
              SizedBox(
                height: 80.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage('assets/images/verifybutton.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
