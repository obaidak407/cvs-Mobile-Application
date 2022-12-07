// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart'
//     show AmplifyAuthCognito;
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
// import 'package:cvs_mobile_application/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:cvs_mobile_application/amplifyconfiguration.dart';
import 'package:cvs_mobile_application/loginScreen.dart';
import 'package:cvs_mobile_application/splashscreen.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      AmplifyStorageS3 storage = AmplifyStorageS3();
      await Amplify.addPlugins([auth, storage]);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CVS Mobile Apllication",
      home: SplashScreen(),
      routes: {
        loginScreen.idScreen: (context) => loginScreen(
              type: '',
            )
      },
    );
  }
}
