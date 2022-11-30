import 'package:cvs_mobile_application/create_acount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:cvs_mobile_application/home_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class loginScreen extends StatefulWidget {
  static const String idScreen = "login";
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  bool isObscure = true;

  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Image(
            image: AssetImage('assets/images/get_started.png'),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: 24,
                  ),
                  TextFormField(
                      cursorColor: Colors.lightGreen,
                      obscureText: isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // ignore: dead_code
                            isObscure ? Icons.visibility_off : Icons.visibility,
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
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget your password?",
                        style: TextStyle(
                          fontFamily: 'outline',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Ink.image(
                        image: AssetImage('assets/images/loginbutton.png'),
                        height: 100,
                      )),
                  SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontFamily: 'Avenir Book',
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const home_screen()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontFamily: 'Avenir Book',
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
