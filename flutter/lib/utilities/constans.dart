import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
const Color kColorGreen = Color.fromARGB(255, 20, 200, 20);
const Color kColorRed = Color.fromARGB(255, 200, 20, 20);


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

