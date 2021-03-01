import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/constants.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  static String id = "Login";
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        imageName: 'login',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login',
              style: kMainTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kInputDecoration.copyWith(hintText: 'Email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kInputDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            MainButton(label: 'Login', onPress: () {})
          ],
        ),
    );
  }
}
