import 'package:intl/intl.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/navigator_controller.dart';

DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm");

UserController userController = UserController();
ActivityController activityController = ActivityController();
ActivityEvaluationController activityEvaluationController =
    ActivityEvaluationController();
CompanyController companyController = CompanyController();
BranchController branchController = BranchController();

MenuController menuController = MenuController();
NavigatorController navigatorController = NavigatorController();
