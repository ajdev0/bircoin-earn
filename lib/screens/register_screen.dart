import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'Register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      imageName: 'register',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Register',
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
          MainButton(label: 'Register', onPress: () {})
        ],
      ),
    );
  }
}
