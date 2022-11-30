import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
          Padding(padding: EdgeInsets.symmetric(horizontal: 24),child:
          Column(children: [
            SizedBox(height: 40,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/app_icon.png",height: 50),
                  Container(
                    width: 90,
                    height: 50,
                    alignment: AlignmentDirectional.topEnd,
                    child: Stack(
                      children: [
                        Image.asset("assets/images/cart.png",height: 50),
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 30.0,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffffa34f),
                                border: Border.all(color: Colors.white, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Text("9",
                                  style: TextStyle(fontSize: 12,color: Colors.white),

                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
            Column(
              children: [
                Container(
                  width: 412,
                  height: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Container(
                        width: 412,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0c000000),
                              blurRadius: 27,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Stack(
                          children:[
                            Positioned(
                              left: 124,
                              top: 52,
                              child: Opacity(
                                opacity: 0.80,
                                child: Text(
                                  "Rusted Lock",
                                  style: TextStyle(
                                    color: Color(0xff001233),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 124,
                              top: 80,
                              child: Opacity(
                                opacity: 0.80,
                                child: Text(
                                  " 1.00 USD",
                                  style: TextStyle(
                                    color: Color(0xff2b9348),
                                    fontSize: 18,
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 124,
                              top: 26,
                              child: Opacity(
                                opacity: 0.50,
                                child: Text(
                                  "Item Name",
                                  style: TextStyle(
                                    color: Color(0xff454955),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 16,
                              child: Container(
                                width: 92,
                                height: 92,
                                child: Stack(
                                  children:[Container(
                                    width: 92,
                                    height: 92,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff7f4f8),
                                    ),
                                  ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          width: 148,
                                          height: 98,
                                          child: FlutterLogo(size: 97.9999771118164),
                                        ),
                                      ),
                                    ),],
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 70.50,
                                  height: 52,
                                  child: Image(image: AssetImage("assets/images/new.png")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],))
      ),
    );
  }
}
