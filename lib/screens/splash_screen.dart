import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                'Welcome',
                style: kMainTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Hero(
              tag: 'logo',
              child: Container(
                child: SvgPicture.asset(
                  'images/login.svg',
                  height: 220,
                ),
              ),
            ),
            Container(
              child: MainButton(
                label: 'Get Started',
                onPress: () {
                  Navigator.pushNamed(context, ScreenLogin.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
