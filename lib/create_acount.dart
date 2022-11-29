import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateAcount extends StatelessWidget {
  const CreateAcount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 360,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24.0),
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
            )
          ],
        ),
      ),
    );
  }
}
