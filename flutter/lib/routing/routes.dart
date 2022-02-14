//String serviceHttp = "https://kalite-takip-yonetim-sistemi.herokuapp.com"; anısı var
String serviceHttp = "http://91.151.89.195:8090";

const mainFormPageDisplayName = "MainForm";
const mainFormPageRoute = "/mainForm";

const employeesPageDisplayName = "Employees";
const employeesPageRoute = "/employees";

const formsPageDisplayName = "Forms";
const formsPageRoute = "/forms";

const settingsPageDisplayName = "SettingsPage";
const settingsPageRoute = "/settingsPage";

///Login - SignUp Sayfaları

const loginPageDisplayName = "Login";
const loginPageRoute = "/login";

const signUpPageDisplayName = "SignUp";
const signUpPageRoute = "/signUp";

///Admin ve Ayarlar Sayfaları

const adminPanelPageDisplayName = "AdminPanel";
const adminPanelPageRoute = "/adminPanel";

///New Activity Sayfaları ve New User
const addNewEmployeePageDisplayName = "AddNewEmployee";
const addNewEmployeePageRoute = "/addNewEmployee";

const newActivityPageDisplayName = "NewActivity";
const newActivityPageRoute = "/newActivity";

const activityEvaluationPageDisplayName = "ActivityEvaluation";
const activityEvaluationPageRoute = "/activityEvaluation";


class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(employeesPageDisplayName, employeesPageRoute),
  MenuItem(mainFormPageDisplayName, mainFormPageRoute),
  MenuItem(formsPageDisplayName, formsPageRoute),
  MenuItem(settingsPageDisplayName, settingsPageRoute),
];
