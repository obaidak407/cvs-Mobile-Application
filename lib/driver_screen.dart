import 'dart:io';

import 'package:cvs_mobile_application/APIs/AuthAPIs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cvs_mobile_application/terns_condition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);
  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool visibility = false;
  File? _image;
  final imagePicker = ImagePicker();

  Future getImagefrom(ImageSource source) async {
    final pick = await imagePicker.pickImage(source: source, imageQuality: 85);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        visibility = false;
      } else {
        Fluttertoast.showToast(msg: "Image is not Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  "Driver",
                  style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                    fontSize: 32,
                    fontFamily: "Avenir Roman",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Information",
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
            Container(
              height: 172,
              width: 350,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibility = true;
                    });
                  },
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/images/DriverLiences.png")),
            ),
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage("assets/images/1099form.png"),
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
                  onTap: () async {
                    var res = await AuthAPIs().uploadImage(_image!);
                    if (res != null) {
                      Fluttertoast.showToast(
                          msg: "Image is  uploaded successfully $res");
                    } else {
                      Fluttertoast.showToast(msg: "Image is not uploaded");
                    }
                  },
                  child: Image(
                    image: AssetImage("assets/images/small_next.png"),
                    height: 60,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Visibility(
              visible: visibility,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {
                    var source = ImageSource.camera;
                    getImagefrom(source);
                  },
                  child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f4f8),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.camera_alt,
                          color: Colors.green, size: 35)),
                ),
                SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  onTap: () async {
                    var source = ImageSource.gallery;
                    getImagefrom(source);
                  },
                  child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f4f8),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.photo,
                          color: Colors.green, size: 35)),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
