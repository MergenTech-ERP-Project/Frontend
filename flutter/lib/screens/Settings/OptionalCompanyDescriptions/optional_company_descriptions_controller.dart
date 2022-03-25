import 'package:get/get.dart';

class OptionalCompanyDescriptionsController extends GetxController {
  var companyBool = true.obs;
  var branchBool = false.obs;
  var departmantBool = false.obs;
  var titleBool = false.obs;

  var companyId = (-1).obs;
  var branchId = (-1).obs;
  var departmentId = (-1).obs;
  var titleId = (-1).obs;

  var companyName = "".obs;
  var branchName = "".obs;
  var departmanName = "".obs;
  var titleName = "".obs;

  var visibleList = false.obs;

  optionalCompanyShowInformation() {
    return (!visibleList.value)
        ? "Şirketleri Göster"
        : (companyName.value.isNotEmpty
                ? ("Şirket: " + companyName.value)
                : "") +
            (branchName.value.isNotEmpty
                ? (" Şube: " + branchName.value)
                : "") +
            (departmanName.value.isNotEmpty
                ? (" Departman: " + departmanName.value)
                : "");
  }
}
