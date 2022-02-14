import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/widgets/large_screen.dart';
import 'package:vtys_kalite/screens/widgets/side_menu.dart';
import 'package:vtys_kalite/screens/widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      //appBar: topNavigationBar(context, _scaffoldKey),
      drawer: Drawer(child: SideMenu()),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
