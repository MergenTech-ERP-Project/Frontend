part of 'routes.dart';

const employeePageDisplayName = "Personel";
const employeePageRoute = "/employee";

const careerPageDisplayName = "Kariyer";
const careerPageRoute = "/career";

const vacationRequestPageDisplayName = "İzin Talepleri";
const vacationRequestPageRoute = "/vacationRequests";

const otherPageDisplayName = "Diğer";
const otherPageRoute = "/other";

List<MenuItem> employeeSideMenuItems = [
  MenuItem(
    employeePageDisplayName,
    employeePageRoute,
    0xFFFF0000.toInt(),
  ),
  MenuItem(
    careerPageDisplayName,
    careerPageRoute,
    0xDDDDDD00.toInt(),
  ),
  MenuItem(
    vacationRequestPageDisplayName,
    vacationRequestPageRoute,
    0xDDDDDD00.toInt(),
  ),
  MenuItem(
    otherPageDisplayName,
    otherPageRoute,
    0xDDDDDD00.toInt(),
  ),
];
