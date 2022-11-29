import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

bool? check1 = false;

class Terms_Condition extends StatelessWidget {
  const Terms_Condition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/backarrow.png'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Terms &",
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
                  "Conditions",
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Material(
                  color: Color(0xfff0f9ef),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                        style: TextStyle(
                          color: Color(0xff454955),
                          fontSize: 16,
                          fontFamily: "Avenir Book",
                          letterSpacing: 0.16,
                        ),
                      ))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    //only check box
                    value: check1, //unchecked
                    onChanged: (bool? value) {
                      //value returned when checkbox is clicked
                    }),
                Text("I agree with the",
                style: TextStyle(
                  fontFamily: "Avenir Book",
                  fontWeight: FontWeight.w700,
                ),
                ),
                Text(
                  " Terms & Conditions",
                  style: TextStyle(
                    color: Color(0xff80d25b),
                    fontFamily: "Avenir Book",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Align(
              child:

                Image(image: AssetImage("assets/images/create_account.png"))
            )
          ],
        ),
      ),
    ));
  }
}
