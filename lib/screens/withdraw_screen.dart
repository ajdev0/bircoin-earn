import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class WirhdrawScreen extends StatefulWidget {
  static String id = "withdraw";
  @override
  _WirhdrawScreenState createState() => _WirhdrawScreenState();
}

class _WirhdrawScreenState extends State<WirhdrawScreen> {
  double _currentSliderValue = 599.0;
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showBottomNav: true,
      imageName: 'withdrawi',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Withdraw',
            style: kMainTextStyle.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Your Earning',
              style: kSubtitleText,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: kOrangeBackground,
                activeTrackColor: kOrange,
                thumbColor: kOrange,
                overlayColor: kOrangeBackground,
                activeTickMarkColor: kOrange,
                disabledActiveTrackColor: kOrange,
                valueIndicatorColor: kOrange,
              ),
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100000,
                label: _currentSliderValue.round().toString(),
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: kSubtitleText,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '100000 mBTC',
                  style: kSubtitleText,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            decoration: kInputDecoration.copyWith(hintText: 'Wallet ID'),
          ),
          SizedBox(
            height: 20,
          ),
          MainButton(label: 'Withdraw', onPress: () {}),
        ],
      ),
    );
  }
}
