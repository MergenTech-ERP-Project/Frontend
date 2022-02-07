import 'package:flutter/material.dart';

class TabGenelSecondCard extends StatelessWidget {
  const TabGenelSecondCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Card(
        color: Colors.red,
        child: Text("b"),
      ),
    );
  }
}