import 'package:cvs_mobile_application/APIs/AuthAPIs.dart';
import 'package:cvs_mobile_application/Models/UserModel.dart';
import 'package:cvs_mobile_application/driver_screen.dart';
import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:cvs_mobile_application/mapscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateAcount extends StatefulWidget {
  final String? type;
  const CreateAcount({Key? key, required this.type}) : super(key: key);

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  bool isObscure = true;
  bool isObscureC = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  UserModel user = UserModel();
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
                        controller: nameController,
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
                        controller: emailController,
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
                    IntlPhoneField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
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
                      ),
                      initialCountryCode: 'pk',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                        controller: passController,
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
                        controller: confirmController,
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
                      height: 50,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/step1_2.png'),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        GestureDetector(
                          child: Image(
                            image: AssetImage('assets/images/nextbtn.png'),
                          ),
                          onTap: () {
                            if (CheckValidations()) {
                              user.email = emailController.text;
                              user.fullName = nameController.text;
                              user.phoneNo = phoneController.text;
                              user.password = passController.text;
                              if (widget.type == 'driver') {
                                user.roles_ID = '1';
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DriverScreen()));
                              } else {
                                user.roles_ID = '2';
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DriverScreen()));
                              }
                            }
                          },
                        ),
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

  bool CheckValidations() {
    if (nameController.text.length < 2) {
      Fluttertoast.showToast(msg: "Please Enter User Name");
      return false;
    }
    if (emailController.text.length < 2 ||
        !emailController.text.contains("@") ||
        !emailController.text.endsWith(".com")) {
      Fluttertoast.showToast(msg: "Please Enter Valid Email");
      return false;
    }
    if (passController.text.length < 8) {
      Fluttertoast.showToast(
          msg: "Enter Password must be greater than 8 characters");
      return false;
    }
    if (!confirmController.text.contains(passController.text)) {
      Fluttertoast.showToast(msg: "Password not Matching");
      return false;
    }
    if (phoneController.text.length < 10) {
      Fluttertoast.showToast(msg: "Please Enter Valid Phone Number");
      return false;
    }
    return true;
  }
}
