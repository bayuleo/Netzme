import 'package:boiler_plate_getx/app/core/widgets/dropdown_field_widget.dart';
import 'package:boiler_plate_getx/app/core/widgets/text_field_widget.dart';
import 'package:boiler_plate_getx/app/utils/date_helper.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:boiler_plate_getx/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> with Validation {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFieldWidget(
                    label: 'Title',
                    controller: controller.titleController,
                    validator: valueRequired,
                    enabled: (controller.data?.time ?? '') !=
                        DateHelper.getYesterday(),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  (controller.data?.time ?? '') != DateHelper.getYesterday()
                      ? DropdownFieldWidget(
                          label: 'Time',
                          validator: valueRequired,
                          value: controller.selectedDate,
                          items: [
                            DropdownMenuItem(
                              value: DateHelper.getToday(),
                              child: const Text('Today'),
                            ),
                            DropdownMenuItem(
                              value: DateHelper.getTomorrow(),
                              child: const Text('Tomorrow'),
                            ),
                            // DropdownMenuItem(
                            //   value: DateHelper.getYesterday(),
                            //   child: const Text('Yesterday'),
                            // ),
                          ],
                          onChanged: controller.onChangeDropdown,
                        )
                      : const TextFieldWidget(
                          label: 'Time',
                          initialValue: 'Yesterday',
                          enabled: false,
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldWidget(
                    label: 'Description',
                    controller: controller.descController,
                    minLines: 8,
                    maxLines: 10,
                    enabled: (controller.data?.time ?? '') !=
                        DateHelper.getYesterday(),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  if ((controller.data?.time ?? '') !=
                      DateHelper.getYesterday())
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        controller.onClickButtonConfirm();
                      },
                      child: controller.formMode == Mode.update
                          ? Text('Update')
                          : Text('Add New Task'),
                    ),
                  if (controller.formMode == Mode.update &&
                      controller.data!.time != DateHelper.getYesterday())
                    SizedBox(
                      height: 20.h,
                    ),
                  if (controller.formMode == Mode.update &&
                      controller.data!.time != DateHelper.getYesterday())
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        controller.onClickButtonRemove();
                      },
                      child: Text('Remove'),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
