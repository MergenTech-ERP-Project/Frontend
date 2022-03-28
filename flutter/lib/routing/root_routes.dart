part of 'routes.dart';

const employeesPageDisplayName = "Personeller";
const employeesPageRoute = "/employees";

const myActivitiesPageDisplayName = "Aktivite";
const myActivitiesPageRoute = "/myActivitiesPage";

const vacationsPageDisplayName = "İzinler";
const vacationsPageRoute = "/vacations";

const formsPageDisplayName = "Form";
const formsPageRoute = "/forms";

const settingsPageDisplayName = "Seçenekler";
const settingsPageRoute = "/settingsPage";

List<MenuItem> rootSideMenuItems = [
  MenuItem(
    employeesPageDisplayName,
    employeesPageRoute,
    0xFFFF0000.toInt(),
  ),
  MenuItem(
    vacationsPageDisplayName,
    vacationsPageRoute,
    0xDDDDDD00.toInt(),
  ),
  MenuItem(
    settingsPageDisplayName,
    settingsPageRoute,
    0xFFF000F0.toInt(),
  ),
  MenuItem(
    myActivitiesPageDisplayName,
    myActivitiesPageRoute,
    0xFF0000FF.toInt(),
  ),
  MenuItem(
    formsPageDisplayName,
    formsPageRoute,
    0xFF00FF00.toInt(),
  ),
];
