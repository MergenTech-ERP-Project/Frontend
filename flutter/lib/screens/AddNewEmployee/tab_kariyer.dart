// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_scrollable_column.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/enums/salary_type.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/User%20Detail/ForCareer/payment.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/generic_dropdown_list.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/payment_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/custombuttonwidget.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabKariyer extends StatefulWidget {
  @override
  State<TabKariyer> createState() => _TabKariyerState();
}

class _TabKariyerState extends State<TabKariyer> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  List<String> positionHeaders = [];
  List<String> positionChildren1 = [];
  List<String> salaryHeaders = [];
  List<String> salaryChildren1 = [];

  @override
  Widget build(BuildContext context) {
    listHeaderAndBodyFunction();
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        buildHeaders(
          Icons.person,
          "Pozisyon",
          "Pozisyon Ekle",
          () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                backgroundColor: lightColor,
                titleWidget: const _PozisyonEkleHeader(),
                bodyWidgetWidth: screenSize.width / 2,
                bodyWidget: SizedBox(
                  child: _PozisyonEklemeBody(),
                ),
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(positionHeaders, Colors.white, 210),
            buildRows(positionChildren1, Colors.white, 210),
          ],
        ),
        buildHeaders(
          Icons.account_balance_wallet,
          "Maaş",
          "Maaş Ekle",
          () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                titleWidget: const MaasEkleHeader(),
                bodyWidget: SizedBox(
                  width: screenSize.width - 20,
                  child: SingleChildScrollView(
                    child: MaasEkleBody(screenSize: screenSize),
                  ),
                ),
                bodyWidgetWidth: screenSize.width / 1.5,
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(salaryHeaders, Colors.white, 500),
            buildRows(salaryChildren1, Colors.white, 500),
          ],
        ),
      ],
    );
  }

  void listHeaderAndBodyFunction() {
    positionHeaders = [
      'Başlangıç',
      'Bitiş',
      'Çalışma Şekli',
      'Şirket',
      'Şube',
      'Departman',
      'Ünvan',
    ];

    positionChildren1 = [
      userHelper.userDetail!.startDateWork,
      userHelper.userDetail!.quitWorkDate,
      EmploymentTypeEnumExtension.getList()[
              userHelper.userDetail!.employmentType.index]
          .toString(),
      userHelper.userDetailCareer!.unitCompany,
      userHelper.userDetailCareer!.unitBranch,
      userHelper.userDetailCareer!.unitDepartment,
      userHelper.userDetailCareer!.unitTitle,
    ];

    salaryHeaders = [
      'Tutar',
      'Ödeme Düzeni',
      'Ek Ödemeler',
    ];

    salaryChildren1 = [
      tabKariyerController.controllerPaymentSalary.text.toString() +
          EmploymentTypeEnumExtension.getList()[
                  userHelper.userDetail!.employmentType.index]
              .toString(),
      tabKariyerController.controllerPaymentName.toString(),
      'Buraya Nasıl Ekleyeceğim Bakacağım Sonra',
    ];
  }

  Widget buildRows(List<String> strings, Color color, double cellWidth) {
    return Container(
      color: color,
      height: 60,
      width: strings.length * cellWidth,
      child: Row(
        children: strings
            .map(
              (e) => Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(e),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildHeaders(
      IconData iconData, String text, String buttonText, onClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: ResponsiveWidget.isLargeScreen(context) ? 4 : 1,
            child: Row(
              children: [
                Icon(iconData, size: 22),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    size: 20,
                    text: text,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomButton(
              title: buttonText,
              pressAction: onClick,
              height: 36,
            ),
          )
        ],
      ),
    );
  }
}

class MaasEkleBody extends StatefulWidget {
  var asgariUcretSwitch = false.obs;
  var netSwitch = false.obs;
  var agiDahilSwitch = false.obs;
  Size screenSize;
  List<Payment> paymentList = <Payment>[].obs;

  MaasEkleBody({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  State<MaasEkleBody> createState() => _MaasEkleBodyState();
}

class _MaasEkleBodyState extends State<MaasEkleBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: NameController(
                controller: tabKariyerController.controllerPaymentSalary,
                label: "Maaş",
                widget: const SizedBox(),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabKariyerController.controllerPaymentUnit,
                label: "Birim",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => CustomSwitch(
                  switchValue: widget.asgariUcretSwitch.value,
                  text: "Asgari Ücret",
                  onChanged: (bool value) {
                    widget.asgariUcretSwitch.value = value;
                  },
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomDropDownMenu(
                icon: const Icon(Icons.arrow_drop_down),
                isExpandedYes: true,
                iconSize: 20,
                valueChoose: userHelper.userDetailPayment!.salaryType.getName,
                text: "Maaş Tipi",
                list: SalaryTypeExtension.getList(),
                onChanged: (val) {
                  setState(() {
                    userHelper.userDetailPayment!.salaryType =
                        SalaryTypeExtension.getEnumFromName(val);
                  });
                },
              ),
            ),
            Expanded(
              child: Obx(
                () => CustomSwitch(
                  switchValue: widget.netSwitch.value,
                  text: "Net",
                  onChanged: (bool value) {
                    widget.netSwitch.value = value;
                  },
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => CustomSwitch(
            switchValue: widget.agiDahilSwitch.value,
            text: "AGİ dahil",
            onChanged: (bool value) {
              widget.agiDahilSwitch.value = value;
            },
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          width: 360,
          title: "Ödeme Ekle",
          rightIcon: Icons.keyboard_arrow_down,
          pressAction: () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                titleWidget: const CustomText(
                  text: "Ödeme Ekleme Ekranı",
                ),
                bodyWidget: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomTextBox(
                        label: "Yapmak istediğiniz ödeme",
                        controller: tabKariyerController.controllerPaymentName,
                        borderless: true,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        title: "Kaydet",
                        pressAction: () {
                          setState(() {
                            if (tabKariyerController.controllerPaymentName.text
                                    .trim() ==
                                "") {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialog(
                                  titleWidget: const CustomText(
                                    text: "Ödeme Ekranı Boş Bırakılamaz",
                                  ),
                                  bodyWidget: const SizedBox(),
                                  bodyWidgetWidth: widget.screenSize.width,
                                ),
                              );
                            } else {
                              widget.paymentList.add(
                                Payment(
                                  name: tabKariyerController
                                      .controllerPaymentName.text,
                                ),
                              );
                            }
                            Get.back();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                bodyWidgetWidth: widget.screenSize.width / 2,
              ),
            );
          },
        ),
        SizedBox(
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PaymentCard(
                  onPressed: () {
                    setState(() {
                      widget.paymentList.removeAt(index);
                    });
                  },
                  newPayment: widget.paymentList[index],
                );
              },
              itemCount: widget.paymentList.length,
            ),
          ),
        ),
      ],
    );
  }
}

class MaasEkleHeader extends StatelessWidget {
  const MaasEkleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          text: 'Maaş Ekle',
        ),
        Row(
          children: [
            CustomButtonWidget(
                label: "İptal",
                function: () {
                  Get.back();
                },
                iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet",
                function: () {
                  Get.back();
                },
                iptalMi: false),
          ],
        ),
      ],
    );
  }
}

class _PozisyonEklemeBody extends StatefulWidget {
  @override
  State<_PozisyonEklemeBody> createState() => _PozisyonEklemeBodyState();
}

class _PozisyonEklemeBodyState extends State<_PozisyonEklemeBody> {
  var companyVisible = false.obs;
  var branchVisible = false.obs;
  var departmentVisible = false.obs;
  var titleVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.info),
                ),
                Flexible(
                  child: CustomText(
                      text:
                          "Şirket, çalışma şekli ve maaş güncellemeleri içeren pozisyon değişikliklerinde "
                          "şirketinizin kurallarını kontrol ediniz.\n"
                          "İleri tarihli varsayılan pozisyonlar başlandgıç tarihinden itibaren geçerli olur."),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          NameController(
            controller: tabKariyerController.positionYoneticisi,
            label: "Yönetici",
            widget: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                tabKariyerController.positionYoneticisi.text = "";
              },
            ),
          ),
          const SizedBox(height: 10),
          NameController(
            controller: tabKariyerController.positionCalismaSekli,
            label: "Çalışma Şekli",
            widget: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                tabKariyerController.positionCalismaSekli.text = "";
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDateTimePicker(
              borderless: true,
              labelText: 'Başlangıç Tarihi',
              onChanged: (val) {
                if (val != null) {
                  try {
                    userHelper.userDetail!.startDateWork = val;
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDateTimePicker(
              borderless: true,
              labelText: 'Bitiş Tarihi',
              onChanged: (val) {
                if (val != null) {
                  try {
                    userHelper.userDetail!.quitWorkDate = val;
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(
                            () => CustomText(
                              textAlign: TextAlign.center,
                              text: optionalCompanyController
                                  .optionalCompanyShowInformation(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: optionalCompanyController.visibleList.value
                            ? const Icon(Icons.keyboard_arrow_down, size: 20)
                            : const Icon(Icons.keyboard_arrow_up, size: 20),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: optionalCompanyController.visibleList.value,
                  child: GenericDropDownList<Company>(
                    isLoading: companyController.isLoading.value,
                    childVisible: companyVisible.value,
                    genericList: companyController.companyList,
                    onSelected: (val) async {
                      companyVisible(!companyVisible.value);
                      branchVisible.value = true;
                      optionalCompanyController.companyId.value = val.id;
                      optionalCompanyController.companyName.value =
                          val.companyName;
                      optionalCompanyController.branchName.value =
                          optionalCompanyController.departmanName.value = "";
                      await branchController.fetchBranchesByCompanyId(val.id);
                    },
                    childGenericList: GenericDropDownList<Branch>(
                      isLoading: branchController.isLoading.value,
                      childVisible: branchVisible.value,
                      genericList: branchController.branchList,
                      onSelected: (val) async {
                        optionalCompanyController.branchId.value = val.id;
                        optionalCompanyController.branchName.value =
                            val.branchName;
                        await departmentController
                            .fetchDepartmentsByBranchId(val.id);

                        optionalCompanyController.departmanName.value = "";
                      },
                      childGenericList: GenericDropDownList<Department>(
                        isLoading: departmentController.isLoading.value,
                        childVisible: departmentVisible.value,
                        genericList: departmentController.departmentList,
                        onSelected: (val) async {
                          optionalCompanyController.departmentId.value = val.id;
                          optionalCompanyController.departmanName.value =
                              val.departmentName;
                          await titleController
                              .fetchTitlesByDepartmentId(val.id);
                        },
                        childGenericList: GenericDropDownList<Titlee>(
                          isLoading: titleController.isLoading.value,
                          childVisible: titleVisible.value,
                          childGenericList: const SizedBox(),
                          genericList: titleController.titleList,
                          onSelected: (val) async {
                            optionalCompanyController.titleId.value = val.id;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                optionalCompanyController.visibleList.value =
                    !optionalCompanyController.visibleList.value;
              });
            },
          ),

          ///TODO: SingleChildScrollView
          Visibility(
            visible: optionalCompanyController.visibleList.value,
            child: GenericDropDownList<Company>(
              isLoading: companyController.isLoading.value,
              childVisible: companyVisible.value,
              genericList: companyController.companyList,
              onSelected: (val) async {
                companyVisible(!companyVisible.value);
                branchVisible.value = true;
                optionalCompanyController.companyId.value = val.id;
                optionalCompanyController.companyName.value = val.companyName;
                optionalCompanyController.branchName.value =
                    optionalCompanyController.departmanName.value = "";
                await branchController.fetchBranchesByCompanyId(val.id);
              },
              childGenericList: GenericDropDownList<Branch>(
                isLoading: branchController.isLoading.value,
                childVisible: branchVisible.value,
                genericList: branchController.branchList,
                onSelected: (val) async {
                  optionalCompanyController.branchId.value = val.id;
                  optionalCompanyController.branchName.value = val.branchName;
                  await departmentController.fetchDepartmentsByBranchId(val.id);

                  optionalCompanyController.departmanName.value = "";
                },
                childGenericList: GenericDropDownList<Department>(
                  isLoading: departmentController.isLoading.value,
                  childVisible: departmentVisible.value,
                  genericList: departmentController.departmentList,
                  onSelected: (val) async {
                    optionalCompanyController.departmentId.value = val.id;
                    optionalCompanyController.departmanName.value =
                        val.departmentName;
                    await titleController.fetchTitlesByDepartmentId(val.id);
                  },
                  childGenericList: GenericDropDownList<Titlee>(
                    isLoading: titleController.isLoading.value,
                    childVisible: titleVisible.value,
                    childGenericList: const SizedBox(),
                    genericList: titleController.titleList,
                    onSelected: (val) async {
                      optionalCompanyController.titleId.value = val.id;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PozisyonEkleHeader extends StatelessWidget {
  const _PozisyonEkleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(text: 'Pozisyon Ekle'),
        Row(
          children: [
            CustomButtonWidget(
                label: "İptal",
                function: () {
                  Get.back();
                },
                iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet",
                function: () {
                  Get.back();
                },
                iptalMi: false),
          ],
        ),
      ],
    );
  }
}
