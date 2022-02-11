import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm");

const Color kColorGreen = Color(0xFF20E692);
const Color kColorRed = Color(0xFFE65B43);

const Color kPrimaryColor = Color(0xFF2BCCE6);
const Color kSecondaryColor = Color(0xFFEFEFEF);
const Color kTertiaryColor = Color(0xFF175e69);
const Color kFourthColor = Color(0xFF208291);
const Color kBackColor = Color(0xFF32322C);
const Color kTextFontColor = Color(0xFF32322C);


const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Comfortaa',
);

const kLabelStyle = TextStyle(
  color: kTextFontColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Comfortaa',
  fontSize: 20
);

const kLabelThinStyle = TextStyle(
    color: kTextFontColor,
    fontFamily: 'Comfortaa',
    fontSize: 20
);

const kLabelThinStyle2 = TextStyle(
    color: kTextFontColor,
    fontFamily: 'Comfortaa',
    fontSize: 16
);

const kLabelAppBarThinStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Comfortaa',
    fontSize: 16
);
const kLabelAppBarStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Comfortaa',
  fontSize: 20,
);

const kTextThinStyle = TextStyle(
    color: kTextFontColor,
    fontFamily: 'Comfortaa',
    fontSize: 16
);

const kLabelHeaderStyle = TextStyle(
    color: kTextFontColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Comfortaa',
    fontSize: 36
);

const kLabelHeader2Style = TextStyle(
    color: kTextFontColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Comfortaa',
    fontSize: 24
);

const kLabelHeader3Style =
    TextStyle(color: kTextFontColor, fontFamily: 'Comfortaa', fontSize: 24);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0,2),
    ),
  ],
);
