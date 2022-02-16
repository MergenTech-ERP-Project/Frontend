import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_initial_page.dart';

class NewActivityPage extends StatefulWidget {
 

  NewActivityPage({Key? key}) : super(key: key);

  List<User> selectedUsers = <User>[].obs;
  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}


class _NewActivityPageState extends State<NewActivityPage> {
  @override
  Widget build(BuildContext context) {    
    return Center(
      child: Row(
        children: [
          const Expanded(child: CustomText(text: "")),
          Expanded(
            flex: ResponsiveWidget.isSmallScreen(context) ? 20 : 4,
            child: NewActivityInitialPage(
              onNextButtonClick: () {},
            ),
          ),
          const Expanded(child: CustomText(text: "")),
        ],
      ),
    );
  }
}