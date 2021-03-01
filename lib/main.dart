import 'package:bitcoin_earn/constants.dart';
import 'package:bitcoin_earn/screens/register_screen.dart';
import 'package:bitcoin_earn/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: MaterialColor(''),
        primaryColor: kOrangeBackground,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        ScreenLogin.id: (context) => ScreenLogin(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
