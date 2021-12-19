import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
const Color kColorGreen = Color(0xFF20E692);
const Color kColorRed = Color(0xFFE65B43);

const Color kPrimaryColor = Color(0xFF2BCCE6);
const Color kSecondaryColor = Color(0xFFC8E2E7);


const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Comfortaa',
);

const kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Comfortaa',
  fontSize: 20
);

const kLabelHeaderStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Comfortaa',
    fontSize: 36
);

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

