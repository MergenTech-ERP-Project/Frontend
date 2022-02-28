import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/authentication_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/navigator_controller.dart';

DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm");

AuthenticationController authenticationController =
    Get.find<AuthenticationController>();
UserController userController = Get.find<UserController>();
ActivityController activityController = Get.find<ActivityController>();
ActivityEvaluationController activityEvaluationController =
    Get.find<ActivityEvaluationController>();
CompanyController companyController = Get.find<CompanyController>();
BranchController branchController = Get.find<BranchController>();

MenuController menuController = Get.find<MenuController>();
NavigatorController navigatorController = Get.find<NavigatorController>();
