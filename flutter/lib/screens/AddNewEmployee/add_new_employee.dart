// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/enums/payment_scheme.dart';
import 'package:vtys_kalite/enums/salary_type.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee_helpers.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_genel.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler_small.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewEmployee extends StatelessWidget {
  var isSaved = false.obs;
  User? user;
  UserHelperController? userHelper;

  AddNewEmployee({
    Key? key,
    this.user,
  }) : super(key: key) {
    if (user != null) {
      showInformationWhenOnClick();
      userHelper = UserHelperController(user!.id);
    } else {
      userHelper = UserHelperController(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: activeColor,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const CustomText(text: "Personel"),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => Get.offAllNamed(rootRoute),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(child: CustomText(text: 'Genel', color: lightColor)),
              Tab(child: CustomText(text: 'Kariyer', color: lightColor)),
              Tab(
                  child:
                      CustomText(text: 'Kişisel Bilgiler', color: lightColor)),
              Tab(child: CustomText(text: 'Diğer Bilgiler', color: lightColor)),
              Tab(child: CustomText(text: 'İzin', color: lightColor)),
              Tab(child: CustomText(text: 'Ödemeler', color: lightColor)),
              Tab(child: CustomText(text: 'Mesai', color: lightColor)),
              Tab(child: CustomText(text: 'Bodro', color: lightColor)),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Diğer", color: lightColor),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TabBarView(
                children: [
                  TabGenel(
                    user: user,
                    userDetail: userHelper!.userDetail,
                    userDetailCareer: userHelper!.userDetailCareer,
                  ),
                  ResponsiveWidget(
                    largeScreen: TabKariyer(
                      userDetail: userHelper!.userDetail,
                      userDetailCareer: userHelper!.userDetailCareer,
                      userDetailPayment: userHelper!.userDetailPayment,
                    ),
                    smallScreen: TabKariyerSmall(),
                  ),
                  ResponsiveWidget(
                    largeScreen: TabPersonalInformation(
                      userDetail: userHelper!.userDetail,
                    ),
                    smallScreen: TabPersonalInformationSmall(),
                  ),
                  TabAnotherInformation(
                    user: user,
                    userDetail: userHelper!.userDetail,
                  ),
                  const Center(child: CustomText(text: "4")),
                  const Center(child: CustomText(text: "5")),
                  const Center(child: CustomText(text: "6")),
                  const Center(child: CustomText(text: "7")),
                  const Center(child: CustomText(text: "8")),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              height: 50,
              child: Container(
                color: lightColor,
                child: Row(
                  children: [
                    Visibility(
                      visible: ResponsiveWidget.isSmallScreen(context)
                          ? false
                          : true,
                      child: const Expanded(
                        flex: 3,
                        child: Text(""),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => Visibility(
                          visible: isSaved.value,
                          child: Row(
                            children: const [
                              Icon(Icons.done),
                              Text(' Kaydedildi!'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'Kaydet',
                        pressAction: () => userDetailSave(context),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'İptal',
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        pressAction: () => Get.offAllNamed(rootRoute),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  userDetailSave(BuildContext context) async {
    isSaved.value = true;
    int userId = 0;
    if (user == null) {
      await userController.addNewUser(
        tabGenelController.controllerName.text +
            tabGenelController.controllerSurname.text,
        tabGenelController.controllerEPostaPersonal.text,
        "qwe123",
        tabGenelController.controllerTelephonePersonal.text,
      );
      userId = await userController.fetchUserByEmailAndPassword(
          tabGenelController.controllerEPostaPersonal.text, "qwe123");
    } else {
      user!.name = tabGenelController.controllerName.text +
          tabGenelController.controllerSurname.text;
      user!.email = tabGenelController.controllerEPostaPersonal.text;
      user!.cellphone = tabGenelController.controllerTelephonePersonal.text;
      userController.updateUser(
        user!.id,
        user!,
      );
      userId = user!.id;
    }

    int? responseUserDetail = await userDetailController.addNewUserDetail(
      UserDetail(
        userId: userId,
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        dateofbirth: userHelper!.userDetail.dateofbirth,
        workPhone: tabGenelController.controllerWorkPhone.text,
        maritalStatus: MaritalStatusEnum.values
            .elementAt(userHelper!.userDetail.maritalStatus!.index),
        numberofkids: tabKisiselBilgilerController.controllerNumberOfKids.text,
        disabledDegree: DisabledDegreeEnum.values
            .elementAt(userHelper!.userDetail.disabledDegree!.index),
        gender:
            GenderEnum.values.elementAt(userHelper!.userDetail.gender!.index),
        educationalStatus: EducationalStatusEnum.values
            .elementAt(userHelper!.userDetail.educationalStatus!.index),
        highestEducationLevelCompleted:
            HighestEducationLevelCompletedEnum.values.elementAt(
                userHelper!.userDetail.highestEducationLevelCompleted!.index),
        lastCompletedEducationStatus: tabKisiselBilgilerController
            .controllerLastCompletedEducationStatus.text,
        employmentType: EmploymentTypeEnum.values
            .elementAt(userHelper!.userDetail.employmentType!.index),
        militaryStatus: MilitaryStatusEnum.values
            .elementAt(userHelper!.userDetail.employmentType!.index),
        startDateWork: userHelper!.userDetail.startDateWork!,
        contractType: ContractTypeEnum.values
            .elementAt(userHelper!.userDetail.contractType!.index),
        contractEndDate: userHelper!.userDetail.contractEndDate!,
        workEmail: tabGenelController.controllerEPostaWork.text,
        address: tabDigerBilgilerController.controllerAdress.text,
        addressCountry: tabDigerBilgilerController.controllerCountry.text,
        addressDistrict: tabDigerBilgilerController.controllerDistrict.text,
        addressCity: tabDigerBilgilerController.controllerCity.text,
        addressZipCode: tabDigerBilgilerController.controllerZipCode.text,
        homePhone: tabDigerBilgilerController.controllerHomePhone.text,
        bankNames: BankNamesEnum.values
            .elementAt(userHelper!.userDetail.bankNames!.index),
        bankAccountType: BankAccountTypeEnum.values
            .elementAt(userHelper!.userDetail.bankAccountType!.index),
        bankAccountNumber:
            tabDigerBilgilerController.controllerAccountNumber.text,
        iban: tabDigerBilgilerController.controllerIBAN.text,

        ///TODO: bunları unutma!!
        emergencyContactPerson: "Ömer Faruk Öztürk",
        relationshipEmergencyContact: "Boss",
        emergencyContactCellPhone: "05436176299",
        quitWorkDate: userHelper!.userDetail.contractEndDate!,
        reasonTypeForQuit: "Ömer Faruk Kovdu Hepsini Muhahaha",
        reasonExplainForQuit: "Yok açıklama. Kovdum ahaha",
        bloodType: BloodTypeEnum.values
            .elementAt(userHelper!.userDetail.bloodType!.index),
      ),
    );
    UserDetail? userDetail =
        await userDetailController.fetchUserDetailById(userId);

    int? responseUserDetailCareer =
        await userDetailCareerController.addNewUserDetailCareer(
      UserDetailCareer(
        userDetailId: userDetail!.id,
        managerName: tabKariyerController.positionYoneticisi.text,
        managerTcno: "12345678910", //TODO
        unitCompany: companyController
            .companyList[tabKariyerController.unitCompanyIndex.value]
            .companyName,
        unitBranch: branchController
            .branchList[tabKariyerController.unitBranchIndex.value].branchName,
        unitDepartment: departmentController
            .departmentList[tabKariyerController.unitDepartmantIndex.value]
            .departmentName,
        unitTitle: "Fakir Parası", //TODO
      ),
    );
    int? responseUserDetailPayment =
        await userDetailPaymentController.addNewUserDetailPayment(
      UserDetailPayment(
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        salary: tabKariyerController.controllerSalary.text,
        currency: "TL", //TODO
        salaryType: SalaryTypeEnum.gross,
        paymentScheme: PaymentSchemeEnum.monthly,
        commuteSupportFee: "617",
        foodSupportFee: "6299",
      ),
    );
    showDialogResponseCheck(
      responseUserDetail!,
      responseUserDetailCareer!,
      responseUserDetailPayment!,
      context,
    );
  }
}
