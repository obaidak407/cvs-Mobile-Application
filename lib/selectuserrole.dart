import 'package:flutter/material.dart';
class SelectUserRole extends StatelessWidget {
  const SelectUserRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:
          SingleChildScrollView(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Image(image: AssetImage('assets/images/topbar.png')),
          Padding(

           padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Please Select',
                  style:
                  TextStyle(
                    fontFamily: 'Avenir Roman',
                    fontSize: 30,
                  ),
                ),
                Row(
                  children: [
                    Text('Your',
                      style:
                      TextStyle(
                        fontFamily: 'Avenir Roman',
                        fontSize: 30,
                      ),
                    ),

                    Text(' Role',
                      style:
                      TextStyle(
                        fontFamily: 'Avenir Roman',
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Text('Before regsitration we need to find out your role.',
                  style:
                  TextStyle(
                    fontFamily: 'Avenir Book',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Register as',
                  style:
                  TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,

                  ),
                ),
                SizedBox(height: 20,),
                OutlinedButton(onPressed: () => key,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,

                      side: BorderSide(color:Colors.green,width: 1 )
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 3),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mechanic / Shop", style: TextStyle(
                            fontFamily: 'Avenir Book',
                            color: Colors.black87,
                            fontSize: 18,
                          )),
                          Icon(
                              Icons.arrow_forward
                          )
                        ],
                      )),
                      ),
                OutlinedButton(onPressed: () => key,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,

                      side: BorderSide(color:Colors.green,width: 1 )
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 3),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Driver", style: TextStyle(
                            fontFamily: 'Avenir Book',
                            color: Colors.black87,
                            fontSize: 18,
                          )),
                          Icon(
                              Icons.arrow_forward
                          )
                        ],
                      )),
                      ),




              ],

            ),
          )

        ],
      )
            ,)
    );
  }
}
