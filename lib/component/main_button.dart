import 'package:bitcoin_earn/constants.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    @required this.label,
    @required this.onPress,
    Key key,
  }) : super(key: key);
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kOrange,
      elevation: 5,
      shadowColor: kOrangeBackground,
      borderRadius: BorderRadius.all(
        Radius.circular(70.0),
      ),
      child: MaterialButton(
        textColor: Colors.white,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Paytone',
            fontSize: 18,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
