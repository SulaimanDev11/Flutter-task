import 'package:check_in_app/data/params/params.dart';
import 'package:check_in_app/l10n/strings.dart';
import 'package:check_in_app/presentation/widgets/app_screen.dart';
import 'package:check_in_app/presentation/widgets/custom_button.dart';
import 'package:check_in_app/presentation/widgets/date_picker.dart';
import 'package:check_in_app/presentation/widgets/text_field.dart';
import 'package:check_in_app/presentation/widgets/time_picker.dart';
import 'package:check_in_app/utils/extensions/date.dart';
import 'package:check_in_app/utils/extensions/num.dart';
import 'package:check_in_app/utils/extensions/time.dart';
import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/label_value_button_card.dart';
import '../controllers/checkin_checkout_controller.dart';

class CheckInCheckOutScreen extends GetView<CheckInCheckOutController> {
  const CheckInCheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenWidget(
      widget: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              labelText: AppStrings.name,
              enabled: true,
              controller: controller.nameController,
              inputType: TextInputType.name,
              regExp: RegExp(r'^[!@#\$%^&*()+{}\[\];<>,?"/\|\0-9]'),
              maxLength: 30,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.nameError;
                }
                return null;
              },
            ),
            10.box,
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.checkInDate,
                      value:
                          controller.checkInDate.value.toReadableDateString(),
                      onTap: () async {
                        DateTime? date =
                            await DatePickerService.getDate(context);
                        if (date != null) {
                          controller.checkInDate.value = date;
                        }
                      },
                    ),
                  ),
                ),
                5.box,
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.checkOutDate,
                      value:
                          controller.checkOutDate.value.toReadableDateString(),
                      onTap: () async {
                        DateTime? date =
                            await DatePickerService.getDate(context);
                        if (date != null) {
                          controller.checkOutDate.value = date;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            5.box,
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.breakTime,
                  style: TextStyle(
                    color: AppColors.heading_text_FF4f23b4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            10.box,
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.startDate,
                      value: controller.startDate.value.toReadableDateString(),
                      onTap: () async {
                        DateTime? date =
                            await DatePickerService.getDate(context);
                        if (date != null) {
                          controller.startDate.value = date;
                        }
                      },
                    ),
                  ),
                ),
                10.box,
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.startTime,
                      value: controller.startTime.value.toReadableString(),
                      onTap: () async {
                        TimeOfDay? time =
                            await TimePickerService.getTime(context);
                        if (time != null) {
                          controller.startTime.value = time;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            10.box,
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.endDate,
                      value: controller.endDate.value.toReadableDateString(),
                      onTap: () async {
                        DateTime? date =
                            await DatePickerService.getDate(context);
                        if (date != null) {
                          controller.endDate.value = date;
                        }
                      },
                    ),
                  ),
                ),
                10.box,
                Expanded(
                  child: Obx(
                    () => LabelValueButtonCard(
                      label: AppStrings.endTime,
                      value: controller.endTime.value.toReadableString(),
                      onTap: () async {
                        TimeOfDay? time =
                            await TimePickerService.getTime(context);
                        if (time != null) {
                          controller.endTime.value = time;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            10.box,
            CustomButton(
              title: AppStrings.addToListTitle,
              onTap: () {
                controller.breakTimes!.add(BreakTimeParams(
                    start: DateTime.now(), end: DateTime.now()));
              },
            ),
            5.box,
            const Divider(),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.breakTimes?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.white_FFFFFFFF,
                      child: ListTile(
                        title: Text(
                            '${controller.breakTimes![index].start.toReadableString()} - ${controller.breakTimes![index].end.toReadableString()}'),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            controller.breakTimes!.removeAt(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            CustomButton(
              title: AppStrings.saveTitle,
              onTap: () {
                if (controller.formKey.currentState?.validate() ?? false) {
                  controller.formKey.currentState?.save();

                  final params = SaveUserParams(
                    name: controller.nameController.text,
                    checkInDateTime: controller.checkInDate.value,
                    checkOutDateTime: controller.checkOutDate.value,
                    breakTime: controller.breakTimes!,
                  );

                  controller.saveUserData(params, context);
                }
              },
            ),
          ],
        ).paddingAll(10.0),
      ),
    );
  }
}
