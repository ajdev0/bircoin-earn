import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//base Colors
const kOrangeBackground = Color(0xFFFFCF82);
const kOrangeIcon = Color(0xFFFBBF5F);
const kOrange = Color(0xFFF9A826);
const kBlack = Color(0xFF6B6B6B);

//font
const kMainTextStyle =
    TextStyle(fontFamily: 'Paytone', color: kOrange, fontSize: 36);

const kSubtitleText =
    TextStyle(color: Color(0xFF6B6B6B), fontSize: 15.0, fontFamily: 'Roboto');

//field
const kInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
  hintText: 'Enter value',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrange, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrangeBackground, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
