import 'dart:io';

import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/constants.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:bitcoin_earn/screens/home_screen.dart';
import 'package:bitcoin_earn/screens/register_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenLogin extends StatefulWidget {
  static String id = "Login";
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class _ScreenLoginState extends State<ScreenLogin> {
  var errorMessage;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool press = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool wrongEmail = false;
  bool wrongPassword = false;

  Widget _spinner() {
    final spin = SpinKitWave(
      color: Colors.red,
      type: SpinKitWaveType.center,
      size: 30,
    );
    return spin;
  }

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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid Email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputDecoration.copyWith(hintText: 'Email'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 charcteres long.';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: kInputDecoration.copyWith(hintText: 'Password'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                MainButton(
                  key: _scaffoldKey,
                  label: 'Login',
                  onPress: () async {
                    press = true;
                    try {
                      if (_formKey.currentState.validate()) {
                        final logedUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('process data')));
                        if (logedUser != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      }
                    } on PlatformException catch (error, st) {
                      print(error.code);
                      print(st);
                    }
                  },
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.pushNamed(context, RegisterScreen.id),
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
