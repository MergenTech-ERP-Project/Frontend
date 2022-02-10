import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/branch_controller.dart';
import 'package:vtys_kalite/controller/company_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';

class Statics {
  //Singleton
  static Statics instance = Statics._internal();
  
  Statics._internal(){
    instance = this;
  }
  User get getUser {
    if(_user == null){
      Statics.instance.userController.userList.forEach((e) {
        if(e.name == username){
          _user = e;
        }
      });
    }
    return _user!;
  }
  void setUserName(String name) {
    _user!.name = name;
  }
  void setUserTitle(Departments title) {
    _user!.title = title;
  }
  void setUser(User? user){
    _user = user;
  }
  User? _user;
  String username = "";
  int drawerSelectedIndex = 0;

  UserController userController = Get.put(UserController());
  ActivityController activityController = Get.put(ActivityController());
  ActivityEvaluationController activityEvaluationController = Get.put(ActivityEvaluationController());
  CompanyController companyController = Get.put(CompanyController());
  BranchController branchController = Get.put(BranchController());
}
