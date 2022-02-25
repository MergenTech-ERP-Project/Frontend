import 'dart:math';

import 'package:get/get.dart';

String? nameLetters(name) {
  var words = name.split(' ');
  String letters = name.length > 0
      ? (words[0][0] +
          (words.length > 1 ? ("" + words[words.length - 1][0]) : ""))
      : "";
  return letters != "" ? letters.capitalize : "";
}

randomColor() {
  return (Random().nextDouble() * 0xFFFFFFFF).toInt();
}
