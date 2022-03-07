// ignore_for_file: must_be_immutable

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
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
import 'package:vtys_kalite/enums/type_of_working.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
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

  UserDetail? userDetail;

  ///null döndürür
  UserDetailCareer? userDetailCareer;
  UserDetailPayment? userDetailPayment;

  AddNewEmployee({
    Key? key,
    this.user,
  }) : super(key: key) {
    zeroToAllController();
    if (user == null) {
      return;
    }
    showInformationWhenOnClick();
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
                  ),
                  ResponsiveWidget(
                    largeScreen: TabKariyer(),
                    smallScreen: TabKariyerSmall(),
                  ),
                  ResponsiveWidget(
                    largeScreen: TabPersonalInformation(),
                    smallScreen: TabPersonalInformationSmall(),
                  ),
                  TabAnotherInformation(),
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

    if (user == null) {
      userController.addNewUser(
        tabGenelController.controllerName.text +
            tabGenelController.controllerSurname.text,
        tabGenelController.controllerEPostaPersonal.text,
        "qwe123",
        tabGenelController.controllerTelephonePersonal.text,
      );
    } else {
      user!.name = tabGenelController.controllerName.text +
          tabGenelController.controllerSurname.text;
      user!.email = tabGenelController.controllerEPostaPersonal.text;
      user!.cellphone = tabGenelController.controllerTelephonePersonal.text;
      userController.updateUser(
        user!.id,
        user!,
      );
    }

    int? responseUserDetail = await userDetailController.addNewUserDetail(
      UserDetail(
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        dateofbirth: tabKisiselBilgilerController.birthDate.toString(),
        workPhone: tabGenelController.controllerWorkPhone.text,
        maritalStatus: MaritalStatusEnum.values
            .elementAt(tabKisiselBilgilerController.maritalStatusIndex),
        numberofkids: tabKisiselBilgilerController.controllerNumberOfKids.text,
        disabledDegree: DisabledDegreeEnum.values
            .elementAt(tabKisiselBilgilerController.disabledDegreeIndex),
        gender: GenderEnum.values
            .elementAt(tabKisiselBilgilerController.genderIndex),
        educationalStatus: EducationalStatusEnum.values
            .elementAt(tabKisiselBilgilerController.educationalStatusIndex),
        highestEducationLevelCompleted: HighestEducationLevelCompletedEnum
            .values
            .elementAt(tabKisiselBilgilerController
                .highestEducationLevelCompletedIndex),
        lastCompletedEducationStatus: tabKisiselBilgilerController
            .controllerLastCompletedEducationStatus.text,
        employmentType: EmploymentTypeEnum.values
            .elementAt(tabGenelController.employmentTypeIndex),
        militaryStatus: MilitaryStatusEnum.values
            .elementAt(tabKisiselBilgilerController.militaryStatusIndex),
        startDateWork: tabGenelController.dateOfStart.toString(),
        contractType: ContractTypeEnum.values
            .elementAt(tabGenelController.contractTypeIndex),
        contractEndDate: tabGenelController.contractEndDate.toString(),
        workEmail: tabGenelController.controllerEPostaWork.text,
        address: tabDigerBilgilerController.controllerAdress.text,
        addressCountry: tabDigerBilgilerController.controllerCountry.text,
        addressDistrict: tabDigerBilgilerController.controllerDistrict.text,
        addressCity: tabDigerBilgilerController.controllerCity.text,
        addressZipCode: tabDigerBilgilerController.controllerZipCode.text,
        homePhone: tabDigerBilgilerController.controllerHomePhone.text,
        bankNames: BankNamesEnum.values
            .elementAt(tabDigerBilgilerController.bankNameIndex),
        bankAccountType: BankAccountTypeEnum.values
            .elementAt(tabDigerBilgilerController.bankAccountType),
        bankAccountNumber:
            tabDigerBilgilerController.controllerAccountNumber.text,
        iban: tabDigerBilgilerController.controllerIBAN.text,
        emergencyContactPerson: "Ömer Faruk Öztürk",
        relationshipEmergencyContact: "Boss",
        emergencyContactCellPhone: "05436176299",
        quitWorkDate: tabGenelController.contractEndDate.toString(),
        reasonTypeForQuit: "Ömer Faruk Kovdu Hepsini Muhahaha",
        reasonExplainForQuit: "Yok açıklama. Kovdum ahaha",
        bloodType: BloodTypeEnum.values
            .elementAt(tabKisiselBilgilerController.bloodGroupIndex),
      ),
    );
    int? responseUserDetailCareer =
        await userDetailCareerController.addNewUserDetailCareer(
      UserDetailCareer(
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        managerName: "Ömer Faruk Öztürk",
        managerTcno: "12345678910",
        unitCompany: "Mergen Yazılım",
        unitBranch: "Esogu Teknopark",
        unitDepartment: "Yazılım",
        unitTitle: "Fakir Parası",
      ),
    );
    int? responseUserDetailPayment =
        await userDetailPaymentController.addNewUserDetailPayment(
      UserDetailPayment(
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        salary: "543",
        currency: "TL",
        salaryType: SalaryTypeEnum.gross,
        paymentScheme: PaymentSchemeEnum.monthly,
        commuteSupportFee: "617",
        foodSupportFee: "6299",
      ),
    );

    if (responseUserDetail! < 200 || responseUserDetail >= 300) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: const CustomText(
              text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
          bodyWidget: const SizedBox(),
          bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
        ),
      );
      return;
    }

    if (responseUserDetailCareer! < 200 || responseUserDetailCareer >= 300) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: const CustomText(
              text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
          bodyWidget: const SizedBox(),
          bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
        ),
      );
      return;
    }

    if (responseUserDetailPayment! < 200 || responseUserDetailPayment >= 300) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: const CustomText(
              text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
          bodyWidget: const SizedBox(),
          bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
        ),
      );
      return;
    }
  }

  zeroToAllController() {
    tabGenelController.controllerName.text = "";
    tabGenelController.controllerSurname.text = "";
    tabGenelController.controllerEPostaWork.text = "";
    tabGenelController.controllerEPostaPersonal.text = "";
    tabGenelController.controllerWorkPhone.text = "";
    tabGenelController.controllerTelephonePersonal.text = "";
    tabGenelController.controllerAccessType.text = "";
    tabGenelController.controllerContractEndDate.text = "";
    tabGenelController.contractTypeIndex = 0;
    tabGenelController.employmentTypeIndex = 0;
    tabGenelController.dateOfStart = DateTime.now();
    tabGenelController.contractEndDate = DateTime.now();

    tabDigerBilgilerController.controllerAdress.text = "";
    tabDigerBilgilerController.controllerHomePhone.text = "";
    tabDigerBilgilerController.controllerCountry.text = "";
    tabDigerBilgilerController.controllerCity.text = "";
    tabDigerBilgilerController.controllerZipCode.text = "";
    tabDigerBilgilerController.controllerDistrict.text = "";
    tabDigerBilgilerController.controllerAccountNumber.text = "";
    tabDigerBilgilerController.controllerIBAN.text = "";
    tabDigerBilgilerController.bankNameIndex = 0;
    tabDigerBilgilerController.bankAccountType = 0;

    tabKariyerController.positionSirket.text = "";
    tabKariyerController.positionSube.text = "";
    tabKariyerController.positionDepartman.text = "";
    tabKariyerController.positionUnvan.text = "";
    tabKariyerController.positionYoneticisi.text = "";
    tabKariyerController.controllerSalary.text = "";
    tabKariyerController.controllerUnit.text = "";
    tabKariyerController.controllerPaymentScreenInSalary.text = "";
    tabKariyerController.positionDateTimeBaslangic = DateTime.now();
    tabKariyerController.positionDateTimeBitis = DateTime.now();
    tabKariyerController.gecerlilikBaslangic = DateTime.now();

    tabKisiselBilgilerController.birthDate = DateTime.now();
    tabKisiselBilgilerController.controllerTcNo.text = "";
    tabKisiselBilgilerController.controllerNationality.text = "";
    tabKisiselBilgilerController.controllerNumberOfKids.text = "";
    tabKisiselBilgilerController.controllerEdicationStatus.text = "";
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        "";
    tabKisiselBilgilerController.maritalStatusIndex = 0;
    tabKisiselBilgilerController.genderIndex = 0;
    tabKisiselBilgilerController.disabledDegreeIndex = 0;
    tabKisiselBilgilerController.bloodGroupIndex = 0;
    tabKisiselBilgilerController.educationalStatusIndex = 0;
    tabKisiselBilgilerController.highestEducationLevelCompletedIndex = 0;
    tabKisiselBilgilerController.militaryStatusIndex = 0;
  }

  showInformationWhenOnClick() {
    var lastSpace = user!.name.lastIndexOf(' ');
    String name =
        lastSpace != -1 ? user!.name.substring(0, lastSpace) : user!.name;
    String surname = lastSpace != -1 ? user!.name.substring(lastSpace + 1) : "";

    tabGenelController.controllerName.text = name;
    tabGenelController.controllerSurname.text = surname;
    // tabGenelController.controllerEPostaWork.text = userDetail!.workEmail!;
    // tabGenelController.controllerWorkPhone.text = userDetail!.workPhone!;
    tabGenelController.controllerEPostaPersonal.text = user!.email;
    tabGenelController.controllerTelephonePersonal.text = user!.cellphone;
    // tabGenelController.dateOfStart =
    //     dateTimeFormat.parse(userDetail!.startDateWork!);
    // tabGenelController.contractEndDate =
    //     dateTimeFormat.parse(userDetail!.contractEndDate!);
    // tabGenelController.contractTypeIndex =
    //     ContractTypeEnum.values.indexOf(userDetail!.contractType!);
    // tabGenelController.employmentTypeIndex =
    //     EmploymentTypeEnum.values.indexOf(userDetail!.employmentType!);

    
    
  }
}
