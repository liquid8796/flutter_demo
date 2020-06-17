
import 'package:cveach/notifications/push_nofitications.dart';
import 'package:cveach/screens/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart';

void main() async {
  Injector.configure(Flavor.PROD);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
      ),
      //home: HomeScreen(),
      initialRoute: HomeScreen.id,
      routes: {
//        WelcomeScreen.id: (context) => WelcomeScreen(),
//        LoginScreen.id: (context) => LoginScreen(),
//        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}


