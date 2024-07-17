// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../core/connect_end/view_model/report_view_model.dart';
import '../../../../../../core/core_folder/app/app.locator.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../app_assets/app_validation.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../../widgets/text_form_widget.dart';
import '../../../../../widgets/text_widget.dart';
import 'guest_list_screen.form.dart';

@FormView(fields: [
  FormTextField(name: 'date'),
])
class GuestListScreen extends StatelessWidget with $GuestListScreen {
  GuestListScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  String? _formattedDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      _formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

      dateController.text = _formattedDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 153, 147),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 60.w, horizontal: 22.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 26.sp,
                    color: AppColor.white,
                  )),
              SizedBox(
                height: 22.h,
              ),
              TextView(
                text: 'Guest List',
                fontWeight: FontWeight.w700,
                fontSize: 24.2.sp,
                color: AppColor.white,
              ),
              SizedBox(
                height: 42.h,
              ),
              TextFormWidget(
                hint: 'Date',
                label: 'DD/MM/YYYY',
                hintColor: AppColor.white,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.2.sp,
                    color: AppColor.inGrey),
                fillColor: AppColor.white,
                isFilled: true,
                readOnly: true,
                suffixWidget: IconButton(
                    onPressed: () => selectDate(context),
                    icon: Icon(
                      Icons.edit_calendar_rounded,
                      size: 20.sp,
                      color: AppColor.deeperprimary,
                    )),
                controller: dateController,
                validator: AppValidator.validateString(),
              ),
              SizedBox(
                height: 150.h,
              ),
              ViewModelBuilder<ReportViewModel>.reactive(
                  viewModelBuilder: () => locator<ReportViewModel>(),
                  disposeViewModel: false,
                  onViewModelReady: (model) {},
                  builder: (_, ReportViewModel model, __) {
                    return ButtonWidget(
                        buttonText: 'Proceed',
                        color: AppColor.white,
                        border: 24,
                        isLoading: model.isLoading,
                        buttonWidth: double.infinity,
                        buttonColor: AppColor.deepprimary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            model.guestlist(
                                context,
                                GuestListEntityModel(
                                    date: dateController.text.trim()));
                          }
                        });
                  }),
              SizedBox(
                height: 16.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
