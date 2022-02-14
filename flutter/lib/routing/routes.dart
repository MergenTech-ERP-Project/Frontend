//String serviceHttp = "https://kalite-takip-yonetim-sistemi.herokuapp.com"; anısı var
String serviceHttp = "http://91.151.89.195:8090";

const mainFormPageDisplayName = "MainForm";
const mainFormPageRoute = "/mainForm";

///Login - SignUp Sayfaları

const loginPageDisplayName = "Login";
const loginPageRoute = "/login";

const signUpPageDisplayName = "SignUp";
const signUpPageRoute = "/signUp";

///Admin ve Ayarlar Sayfaları

const adminPanelPageDisplayName = "AdminPanel";
const adminPanelPageRoute = "/adminPanel";

const settingsPageDisplayName = "SettingsPage";
const settingsPageRoute = "/settingsPage";

///New Activity Sayfaları ve New User
const addNewEmployeePageDisplayName = "AddNewEmployee";
const addNewEmployeePageRoute = "/addNewEmployee";

const employeesPageDisplayName = "Employees";
const employeesPageRoute = "/employees";

const newActivityPageDisplayName = "NewActivity";
const newActivityPageRoute = "/newActivity";

const activityEvaluationPageDisplayName = "ActivityEvaluation";
const activityEvaluationPageRoute = "/activityEvaluation";

///Formlar
const formsPageDisplayName = "Forms";
const formsPageRoute = "/forms";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(mainFormPageDisplayName, mainFormPageRoute),
  MenuItem(loginPageDisplayName, loginPageRoute),
  MenuItem(signUpPageDisplayName, signUpPageRoute),
  MenuItem(adminPanelPageDisplayName, adminPanelPageRoute),
  MenuItem(settingsPageDisplayName, settingsPageRoute),
  MenuItem(addNewEmployeePageDisplayName, addNewEmployeePageRoute),
  MenuItem(newActivityPageDisplayName, newActivityPageRoute),
  MenuItem(activityEvaluationPageDisplayName, activityEvaluationPageRoute),
  MenuItem(formsPageDisplayName, formsPageRoute),
];
