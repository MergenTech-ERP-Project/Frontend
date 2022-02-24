import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class OptionalCompanyCard extends StatelessWidget {
  RxBool visible, cardVisible = false.obs;
  final String title;
  final Widget addNewWidget, childWidget;
  OptionalCompanyCard({
    Key? key,
    required this.visible,
    required this.addNewWidget,
    required this.title,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: visible.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: activeColor.withOpacity(.4)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    cardVisible.value = !cardVisible.value;
                  },
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            text: title,
                            weight: FontWeight.bold,
                            size: 22,
                          ),
                          const Expanded(child: SizedBox()),
                          CustomButton(
                            width: 150,
                            height: 40,
                            leftIcon: Icons.add,
                            title: "Yeni Ekle",
                            pressAction: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => addNewWidget,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: cardVisible.value,
                  child: childWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
