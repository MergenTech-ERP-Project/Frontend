
import 'package:flutter/material.dart';

class CustomScrollableColumn extends StatefulWidget {
  CustomScrollableColumn({
    Key? key,
    required this.children,
    required this.scrollController,
  }) : super(key: key);

  List<Widget> children;
  final ScrollController scrollController;

  @override
  State<CustomScrollableColumn> createState() => _CustomScrollableColumnState();
}

class _CustomScrollableColumnState extends State<CustomScrollableColumn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}
