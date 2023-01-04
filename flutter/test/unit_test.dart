import 'dart:math';

import 'package:erp_test/controller/Backend%20Controller/activity_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/branch_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/company_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/departmant_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/security_user_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/title_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_career_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_detail_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_payment_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_vacation_controller.dart';
import 'package:erp_test/enums/payment_scheme.dart';
import 'package:erp_test/enums/salary_type.dart';
import 'package:erp_test/enums/vacation_request_status.dart';
import 'package:erp_test/models/User%20Detail/user_career.dart';
import 'package:erp_test/models/User%20Detail/user_detail.dart';
import 'package:erp_test/models/User%20Detail/user_payment.dart';
import 'package:erp_test/models/User%20Detail/user_vacation.dart';
import 'package:erp_test/models/activity.dart';
import 'package:erp_test/models/activity_evaluation.dart';
import 'package:erp_test/models/settings/branch.dart';
import 'package:erp_test/models/settings/company.dart';
import 'package:erp_test/models/settings/department.dart';
import 'package:erp_test/models/settings/title.dart';
import 'package:erp_test/services/activity_evaluation_remote_services.dart';
import 'package:erp_test/services/activity_remote_services.dart';
import 'package:erp_test/services/branch_remote_services.dart';
import 'package:erp_test/services/company_remote_services.dart';
import 'package:erp_test/services/department_remote_services.dart';
import 'package:erp_test/services/title_remote_services.dart';
import 'package:erp_test/services/user_detail_remote_services.dart';
import 'package:erp_test/utilities/controllers.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:erp_test/main.dart';
import 'package:get/get.dart';

void main() {
  group("Security User", () {
    Get.put(SecurityUserController());
    Get.put(UserController());
    Get.put(CompanyController());
    Get.put(BranchController());
    Get.put(DepartmentController());
    Get.put(TitleController());
    Get.put(ActivityController());
    Get.put(UserDetailCareerController());
    Get.put(UserDetailCareerController());
    Get.put(ActivityEvaluationController());
    Get.put(UserDetailController());
    Get.put(UserDetailCareerController());
    Get.put(UserDetailPaymentController());
    Get.put(UserDetailVacationController());

    test("Signup", () async {
      var responseStatusCode = (await securityUserController.signUp(
        username: "mod",
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      expectLater(responseStatusCode, 400);
    });

    test("Signin", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      expectLater(securityUser.email, "mod@donem.com");
      expectLater(securityUser.username, "mod");
    });

    test("User fetch List", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await userController.fetchUsers();

      //Email zorunlu olmasına rağmen emaili girilmemiş kullanıcılar var
      expectLater(userController.userList.isNotEmpty, true);
      for (var i in userController.userList) {
        expectLater(i.email.isEmpty, false);
        print(i.email);
      }
    });

    test("Company List", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      var company = companyController.companyList;
      expectLater(company.length, 0);

      company = await CompanyRemoteServices.fetchCompanies() as List<Company>;
      expectLater(company.isEmpty, false);
    });

    test("Company Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await companyController.newAddCompany(Company(
        companyName: "name",
        companyPhone: "phone",
        domainName: "domain",
        mersisNo: "mersis",
        sgkCompanyNo: "sgkCompany",
      ));

      final company = companyController.companyList;

      //Bu bi hata mesela burada true beklenmemesi gerekiyordu
      expectLater(company.isEmpty, false);
    });

    test("Company Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;
      var list = [];
      expect(list.length, 0);
      list = await CompanyRemoteServices.fetchCompanies() as List<Company>;

      //Company Remove gerçekleşmiyor.
      expectLater(list.length, 15);
      await CompanyRemoteServices.removeCompany(5);
      list = await CompanyRemoteServices.fetchCompanies() as List<Company>;
      expectLater(list.length, 14);
    });

    test("Branch List", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      List branch = branchController.branchList;
      expectLater(branch.length, 0);

      await branchController.addNewBranch(
        Branch(
          companyId: 11,
          vacationDates: "dates",
          rules: "rules",
          branchUpper: "upper",
          branchName: "name",
        ),
        11,
      );
      branch = await BranchRemoteServices.fetchBranches() as List<Branch>;

      expectLater(branch.isEmpty, false);
    });

    test("Branch Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await branchController.addNewBranch(
        Branch(
          companyId: 11,
          vacationDates: "dates",
          rules: "rules",
          branchUpper: "upper",
          branchName: "name",
        ),
        11,
      );

      await BranchRemoteServices.fetchBranches();
      expectLater(branchController.branchList.first.branchName, "name");
    });

    test("Branch Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;
      var list = [];
      expect(list.length, 0);
      list = await BranchRemoteServices.fetchBranches() as List<Branch>;
      expectLater(list.length, 6);
      await BranchRemoteServices.removeBranch(10);
      list = await BranchRemoteServices.fetchBranches() as List<Branch>;
      //Hata! Silmesi beklenirken silmediği gözlemlendi.
      expectLater(list.length, 5);
    });

    test("Departmant List", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      List departmant = departmentController.departmentList;
      expectLater(departmant.length, 0);

      await departmentController.newDepartment(
        Department(branchId: 5, departmentName: "Name"),
        5,
      );

      departmant =
          await DepartmentRemoteServices.fetchDepartments() as List<Department>;
      expectLater(departmant.isEmpty, false);
    });

    test("Departmant Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await departmentController.newDepartment(
        Department(branchId: 5, departmentName: "Name"),
        5,
      );

      await DepartmentRemoteServices.fetchDepartments();
      expectLater(
          departmentController.departmentList.first.departmentName, "Name");
    });

    test("Departmant Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      var list = [];
      expect(list.length, 0);
      list =
          await DepartmentRemoteServices.fetchDepartments() as List<Department>;
      expectLater(list.length, 5);
      await DepartmentRemoteServices.removeDepartment(5);
      list =
          await DepartmentRemoteServices.fetchDepartments() as List<Department>;
      //Hata! Silmesi beklenirken silmediği gözlemlendi.
      expectLater(list.length, 4);
    });

    test("Title List", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      List title = titleController.titleList;
      expectLater(title.length, 0);

      await titleController.newTitle(
        Titlee(
          titleName: "title",
          departmentId: 5,
        ),
        5,
      );

      title = await TitleRemoteServices.fetchTitles() as List<Titlee>;
      expectLater(title.isEmpty, false);
    });

    test("Title Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await titleController.newTitle(
        Titlee(
          titleName: "title",
          departmentId: 5,
        ),
        5,
      );

      await TitleRemoteServices.fetchTitles();
      expectLater(titleController.titleList.first.titleName, "title");
    });

    test("Title Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      var list = [];
      expect(list.length, 0);
      list = await TitleRemoteServices.fetchTitles() as List<Titlee>;
      expectLater(list.length, 3);
      await TitleRemoteServices.removeTitle(5);
      list = await TitleRemoteServices.fetchTitles() as List<Titlee>;
      //Hata! Silmesi beklenirken silmediği gözlemlendi.
      expectLater(list.length, 2);
    });

    test("Activiy Fetch", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      var list = [];
      var start = list.length;
      expect(list.length, start);
      list = await ActivityRemoteServices.fetchActivities() as List<Activity>;
      expectLater(list.isEmpty, true);
    });

    test("Activiy Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      await activityController.postActivity(
        Activity(
          name: "name",
          datetime: "date",
          organizator: "organizator",
          place: "place",
          id: 999,
        ),
      );

      await ActivityRemoteServices.fetchActivities();
      //Burda hata var. Ekleme yapılınca aktivite listesi boş olmaması gerekiyordu.
      expectLater(activityController.activityList.isEmpty, false);
    });

    test("Activiy Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;
      await activityController.postActivity(
        Activity(
          name: "name",
          datetime: "date",
          organizator: "organizator",
          place: "place",
          id: 999,
        ),
      );
      await ActivityRemoteServices.fetchActivities();
      expectLater(activityController.activityList.length, 1);

      await ActivityRemoteServices.removeActivity(2);

      //Aktivite kaldırma işleminin gerçekleşmesi gerekiyordu ancak hata var. Silmiyor
      await ActivityRemoteServices.fetchActivities();
      expectLater(activityController.activityList.length, 0);
    });

    test("Activity Evaluation Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;
      await activityController.postActivity(
        Activity(
          name: "name",
          datetime: "date",
          organizator: "organizator",
          place: "place",
          id: 999,
        ),
      );
      await activityEvaluationController.postActivityEvaluation(4, 1, "hi");

      final list =
          await ActivityEvaluationRemoteServices.fetchActivityEvaluations()
              as List<ActivityEvaluation>;

      expect(list.length, 2);
    });

    test("Activity Evaluation Fetch List",  () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;
      List<ActivityEvaluation> list = [];
      expect(list.length, 0);

      list = await ActivityEvaluationRemoteServices.fetchActivityEvaluations()
          as List<ActivityEvaluation>;

      expectLater(list.length, 2);
    });

    test("Activity Evaluation By ID", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      //Kod Hatalı Future kullanımı gerçekleşmemiş. Thread kullanımı yapılmamış.
      //final list = await activityEvaluationController.fetchActivityEvaluationByActivityId(14)as List<ActivityEvaluation>;
      //expectLater(list.length, 1);
    });

    test("User Detail by ID", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      UserDetail? detail =
          await UserDetailRemoteServices.fetchUserDetailByUserId(1);
      //Detail için gerekli olan endpoint tamamen geçersiz ve sistemde kullanılmaya devam ediliyor.
      expectLater(detail!.userId, 1);
    });

    test("User Detail Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      int statusCode = await userDetailController.addNewUserDetail(
        detail: UserDetail(
          userId: 1,
          tcno: "11111111111",
        ),
      );

      //Required olarak eklenen tcno ve userID eklenmiş ama diğerlerinden bazıları null olamayacağı için
      //response status code 400 döndürüyor.
      expectLater(statusCode, 200);
    });

    test("UserDetail Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için testinin gerçekleşip gerçekleşmediğini
      ///UI Unit Testinde gerçekleştiremiyorum.
      var responseStatusCode = await userDetailController.deleteUserDetail(1, 1);
      ///200 Integer olmasına rağmen return olarak String? döndürülmesi istenmiş. Yanlış tamamen!
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Carreer Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için UserCareer için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
          await userDetailCareerController.addNewUserDetailCareer(
        career: UserDetailCareer(
          userDetailId: 1,
          adminName: "admin",
          adminTcno: "11111111111",
          unitBranch: "branch",
          unitCompany: "company",
          unitDepartment: "departmant",
          unitTitle: "title",
        ),
      );

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Carreer Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için UserCareer için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
          await userDetailCareerController.deleteUserDetailCareer(1);

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Payment Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için Payment için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
          await userDetailPaymentController.addNewUserDetailPayment(
        payment: UserDetailPayment(
          userDetailId: 1,
          salary: "salary",
          commuteSupportFee: "commute",
          currency: "currency",
          foodSupportFee: "food",
          paymentScheme: PaymentSchemeEnum.daily,
          salaryType: SalaryTypeEnum.gross,
        ),
      );

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Payment Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için Payment için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
          await userDetailPaymentController.deleteUserDetailPayment(1);

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Vacation Add", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için Vacation için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
          await userDetailVacationController.addNewUserDetailVacation(
        UserDetailVacation(
          userDetailId: 1,
          vacationRequestStatus: VacationRequestStatusEnum.approved,
          permissonSaveId: 1,
          recognizant: "recognizant",
          sicilNo: "sicilNo",
          vacationType: 1,
          workingDayNumber: 1,
          workStartDate: "workStartDate"
        ),
      );

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });

    test("UserDetail Vacation Remove", () async {
      securityUser = (await securityUserController.signIn(
        email: "mod@donem.com",
        password: "125fatih",
      ))!;

      ///User Detail resti çalışmadığı için Vacation için kontrol gerçekleştiremiyorum.
      var responseStatusCode =
      await userDetailVacationController.deleteUserDetailCareer(14);

      ///200 dönmesi gerekiyordu. Ancak userDetailId bağlayamıyorum.
      expectLater(responseStatusCode, 200);
    });
  });
}
