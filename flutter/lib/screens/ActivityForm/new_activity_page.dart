import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_initial_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_select_users_page.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  List<User> selectedUsers = <User>[].obs;
  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}


class _NewActivityPageState extends State<NewActivityPage> {
  //final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const Expanded(child: CustomText(text: "")),
            Expanded(
              flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 6,
              child: NewActivityInitialPage(
                onNextButtonClick: () {},
              ),
            ),
            const Expanded(child: CustomText(text: "")),
          ],
        ),
      ),
    );
  }
}

/* pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                  ); */

/* PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ////////////
                  NewActivitySelectUsersPage(
                    onPreviousButtonClick: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.decelerate,
                      );
                    },
                  ),
                ],
              ) */