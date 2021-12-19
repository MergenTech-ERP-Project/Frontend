import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';

class Statics {
  //Singleton
  static Statics instance = Statics._internal();
  Statics._internal(){
    instance = this;
  }

  int userId = 0;
  UserController userController = Get.put(UserController());
  ActivityController activityController = Get.put(ActivityController());
  ActivityEvaluationController activityEvaluationController = Get.put(ActivityEvaluationController());
}