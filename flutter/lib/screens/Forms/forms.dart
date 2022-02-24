import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/Forms/NonWorking_Activity_Daily_Inspection_Form/daily_inspection_form.dart';
import 'package:vtys_kalite/screens/Forms/PermissionRequestForm/permission_request_form.dart';
import 'package:vtys_kalite/screens/Forms/Travel_Assignment_Notification_Form/travel_assignment_notification_form.dart';

class FormsInfo {
  final String name;
  final Widget formPage;
  bool formsPageOnTap;

  FormsInfo(
    this.name,
    this.formPage,
    this.formsPageOnTap,
  );
}

FormsInfo dailyInspectionFormInfo = FormsInfo(
    "Mesai Dışı Günlük İzlem Formu", DailyInspectionFormPage(), false);
FormsInfo permissionRequestFormInfo =
    FormsInfo("İzin Talep Formu", PermissionRequestFormPage(), false);

FormsInfo travelAssignmentNotificationFormInfo = FormsInfo(
    "Seyahat Görevlendirme / Bildirim Formu",
    TravelAssignmentNotificationFormPage(),
    false);

List<FormsInfo> formsList = <FormsInfo>[
  dailyInspectionFormInfo,
  permissionRequestFormInfo,
  travelAssignmentNotificationFormInfo
];
