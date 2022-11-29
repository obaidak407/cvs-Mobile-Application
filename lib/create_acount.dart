import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateAcount extends StatefulWidget {
  const CreateAcount({Key? key}) : super(key: key);

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  bool isObscure = true;
  bool isObscureC = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/backarrow.png'),
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
                      "Create ",
                      style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 32,
                          color: Colors.black),
                    ),
                    Text(
                      "Acount!",
                      style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 32,
                          color: Color.fromRGBO(43, 147, 72, 1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Are you new on CVS, Register Now!",
                      style: TextStyle(
                          fontFamily: 'Avenir Roman',
                          fontSize: 18,
                          color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Column(
                  children: [
                    TextFormField(
                        cursorColor: Colors.lightGreen,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              color: Colors.green),
                          hintText: 'Enter Full Name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(5, 129, 98, 1))),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                        cursorColor: Colors.lightGreen,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              color: Colors.green),
                          hintText: 'Enter Email Address',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(5, 129, 98, 1))),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                        cursorColor: Colors.lightGreen,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              color: Colors.green),
                          hintText: 'Enter Phone Number',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(5, 129, 98, 1))),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                        cursorColor: Colors.lightGreen,
                        obscureText: isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // ignore: dead_code
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          labelText: 'Enter Password',
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              color: Colors.green),
                          hintText: 'Enter Password',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(5, 129, 98, 1))),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                        cursorColor: Colors.lightGreen,
                        obscureText: isObscureC,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // ignore: dead_code
                              isObscureC
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscureC = !isObscureC;
                              });
                            },
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              color: Colors.green),
                          hintText: 'Confirm Password',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(5, 129, 98, 1))),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Step 1/3",
                              style: TextStyle(
                                  fontFamily: 'Avenir Roman',
                                  fontSize: 18,
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account? ",
                          style: TextStyle(
                            fontFamily: 'Avenir Book',
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                loginScreen.idScreen, (route) => false);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Avenir Book',
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
