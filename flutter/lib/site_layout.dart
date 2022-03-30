// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/widgets/large_screen.dart';
import 'package:vtys_kalite/screens/widgets/side_menu.dart';
import 'package:vtys_kalite/screens/widgets/small_screen.dart';
import 'package:vtys_kalite/screens/widgets/top_navigation_bar.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List items;
  final Widget navigator;

  final Widget trailingWidget;

  SiteLayout({
    Key? key,
    required this.items,
    required this.navigator,
    required this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: topNavigationBar(context, _scaffoldKey, trailingWidget),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              child: SideMenu(
              text: "Mergen Tech",
              items: items,
            ))
          : null,
      body: ResponsiveWidget(
        largeScreen: LargeScreen(
          items: items,
          navigator: navigator,
        ),
        smallScreen: SmallScreen(
          navigator: navigator,
        ),
      ),
    );
  }
}
