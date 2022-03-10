import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserHelperController {
  final int userId;
  late UserDetail userDetail;
  late UserDetailCareer userDetailCareer;
  late UserDetailPayment userDetailPayment;

  UserHelperController(this.userId) {
    ///TODO: fetch yapılacak burada!!!
    userDetail = UserDetail(
      userId: userId,
      bankAccountType: BankAccountTypeEnum.values.first,
      bankNames: BankNamesEnum.values.first,
      bloodType: BloodTypeEnum.values.first,
      contractType: ContractTypeEnum.values.first,
      disabledDegree: DisabledDegreeEnum.values.first,
      educationalStatus: EducationalStatusEnum.values.first,
      employmentType: EmploymentTypeEnum.values.first,
      gender: GenderEnum.values.first,
      highestEducationLevelCompleted:
          HighestEducationLevelCompletedEnum.values.first,
      maritalStatus: MaritalStatusEnum.values.first,
      militaryStatus: MilitaryStatusEnum.values.first,
    );
    userDetailCareer = UserDetailCareer(userDetailId: userDetail.id);
    userDetailPayment = UserDetailPayment(userDetailId: userDetail.id);
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
    userDetail.contractType = ContractTypeEnum.values.first;
    userDetail.employmentType = EmploymentTypeEnum.values.first;
    userDetail.startDateWork = dateTimeFormat.format(DateTime.now());
    userDetail.contractEndDate = dateTimeFormat.format(DateTime.now());

    tabDigerBilgilerController.controllerAdress.text = "";
    tabDigerBilgilerController.controllerHomePhone.text = "";
    tabDigerBilgilerController.controllerCountry.text = "";
    tabDigerBilgilerController.controllerCity.text = "";
    tabDigerBilgilerController.controllerZipCode.text = "";
    tabDigerBilgilerController.controllerDistrict.text = "";
    tabDigerBilgilerController.controllerAccountNumber.text = "";
    tabDigerBilgilerController.controllerIBAN.text = "";
    userDetail.bankNames = BankNamesEnum.values.first;
    userDetail.bankAccountType = BankAccountTypeEnum.values.first;

    ///TODO: COMPANY BRANCH DEPARTMANT TITLE
    //userDetailCareer.unitCompany = null;
    // userDetailCareer.unitBranch = null;
    // userDetailCareer.unitDepartment = null;
    // userDetailCareer.unitTitle = null;
    tabKariyerController.positionUnvan.text = "";
    tabKariyerController.positionYoneticisi.text = "";
    tabKariyerController.controllerSalary.text = "";
    tabKariyerController.controllerUnit.text = "";
    tabKariyerController.controllerPaymentScreenInSalary.text = "";

    userDetail.dateofbirth = dateTimeFormat.format(DateTime.now());
    tabKisiselBilgilerController.controllerTcNo.text = "";
    tabKisiselBilgilerController.controllerNationality.text = "";
    tabKisiselBilgilerController.controllerNumberOfKids.text = "";
    tabKisiselBilgilerController.controllerEdicationStatus.text = "";
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        "";
    userDetail.maritalStatus = MaritalStatusEnum.values.first;
    userDetail.gender = GenderEnum.values.first;
    userDetail.disabledDegree = DisabledDegreeEnum.values.first;
    userDetail.bloodType = BloodTypeEnum.values.first;
    userDetail.educationalStatus = EducationalStatusEnum.values.first;
    userDetail.highestEducationLevelCompleted =
        HighestEducationLevelCompletedEnum.values.first;
    userDetail.militaryStatus = MilitaryStatusEnum.values.first;
  }
}
