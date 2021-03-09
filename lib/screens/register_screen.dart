import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:bitcoin_earn/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'Register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool press = false;

  _spinner() {
    return SpinKitWave(
      color: Colors.red,
      type: SpinKitWaveType.center,
      size: 30,
    );
  }

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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // _spinner(),
                TextFormField(
                  //onChanged: (value) {},
                  validator: (value) {
                    email = value;
                    return _formValidation(value, 'Please enter Email');
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputDecoration.copyWith(hintText: 'Email'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    password = value;
                    return _formValidation(value, 'Please enter password');
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputDecoration.copyWith(hintText: 'Password'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                (press == true)
                    ? _spinner()
                    : MainButton(
                        label: 'Register',
                        onPress: () {
                          press = true;

                          if (_formKey.currentState.validate()) {
                            _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            Navigator.pushNamed(context, HomeScreen.id);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Processin Data'),
                              ),
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.pushNamed(context, RegisterScreen.id),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  _formValidation(value, String message) {
    if (value.isEmpty) {
      return message;
    }
    return null;
  }
}
