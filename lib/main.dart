import 'package:bitcoin_earn/constants.dart';
import 'package:bitcoin_earn/screens/home_screen.dart';
import 'package:bitcoin_earn/screens/offer_screen.dart';
import 'package:bitcoin_earn/screens/refer_screen.dart';
import 'package:bitcoin_earn/screens/register_screen.dart';
import 'package:bitcoin_earn/screens/splash_screen.dart';
import 'package:bitcoin_earn/screens/withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: ScreenLogin.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        ScreenLogin.id: (context) => ScreenLogin(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ReferScreen.id: (context) => ReferScreen(),
        WirhdrawScreen.id: (context) => WirhdrawScreen(),
        OfferScreen.id: (context) => OfferScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
