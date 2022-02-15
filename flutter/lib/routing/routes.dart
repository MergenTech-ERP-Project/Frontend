String serviceHttp = "https://kalite-takip-yonetim-sistemi.herokuapp.com";
//String serviceHttp = "http://91.151.89.195:8090";

const rootRoute = "/home";

const employeesPageDisplayName = "Employees";
const employeesPageRoute = "/employees";

const mainFormPageDisplayName = "My Activities";
const mainFormPageRoute = "/mainFormPage";

const formsPageDisplayName = "Forms";
const formsPageRoute = "/forms";

const settingsPageDisplayName = "Settings";
const settingsPageRoute = "/settingsPage";

///Login - SignUp Sayfaları

const loginPageDisplayName = "Login";
const loginPageRoute = "/login";

const signUpPageDisplayName = "Sign Up";
const signUpPageRoute = "/signUp";

///Admin ve Ayarlar Sayfaları

const adminPanelPageDisplayName = "Admin Panel";
const adminPanelPageRoute = "/adminPanel";

///New Activity Sayfaları ve New User
const addNewEmployeePageDisplayName = "Add New Employee";
const addNewEmployeePageRoute = "/addNewEmployee";

const newActivityPageDisplayName = "New Activity";
const newActivityPageRoute = "/newActivity";

const activityEvaluationPageDisplayName = "Activity Evaluation";
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
