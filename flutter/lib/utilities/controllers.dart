import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/departmant_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/title_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_career_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_detail_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_payment_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/authentication_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/navigator_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_diger_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_genel_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kariyer_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kisisel_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/optional_company_descriptions_controller.dart';

DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm");
DateFormat dateFormat = DateFormat("dd/MM/yyyy");

AuthenticationController authenticationController =
    Get.find<AuthenticationController>();
UserController userController = Get.find<UserController>();
ActivityController activityController = Get.find<ActivityController>();
ActivityEvaluationController activityEvaluationController =
    Get.find<ActivityEvaluationController>();

CompanyController companyController = Get.find<CompanyController>();
BranchController branchController = Get.find<BranchController>();
DepartmentController departmentController = Get.find<DepartmentController>();
TitleController titleController = Get.find<TitleController>();

MenuController menuController = Get.find<MenuController>();
NavigatorController navigatorController = Get.find<NavigatorController>();

UserDetailController userDetailController = Get.find<UserDetailController>();
UserDetailCareerController userDetailCareerController =
    Get.find<UserDetailCareerController>();
UserDetailPaymentController userDetailPaymentController =
    Get.find<UserDetailPaymentController>();

TabGenelController tabGenelController = Get.find<TabGenelController>();
TabKariyerController tabKariyerController = Get.find<TabKariyerController>();
TabDigerBilgilerController tabDigerBilgilerController =
    Get.find<TabDigerBilgilerController>();
TabKisiselBilgilerController tabKisiselBilgilerController =
    Get.find<TabKisiselBilgilerController>();

OptionalCompanyDescriptionsController optionalCompanyController =
    Get.find<OptionalCompanyDescriptionsController>();
