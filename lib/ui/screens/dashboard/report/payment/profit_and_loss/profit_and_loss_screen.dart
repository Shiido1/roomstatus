// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/model/profit_and_loss_entity_model.dart';
import 'package:roomstatus/ui/screens/dashboard/report/payment/profit_and_loss/profit_and_loss_screen.form.dart';
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

@FormView(fields: [
  FormTextField(name: 'start'),
  FormTextField(name: 'end'),
])
class ProfitAndLossScreen extends StatelessWidget with $ProfitAndLossScreen {
  ProfitAndLossScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedCheckinDate = DateTime.now();

  DateTime selectedCheckoutDate = DateTime.now();

  String? _formattedCheckInDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  String? _formattedCheckOutDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectCheckInDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckinDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      _formattedCheckInDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckinDate);

      startController.text = _formattedCheckInDate!;
    }
  }

  Future<void> selectCheckOutDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckoutDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
      _formattedCheckOutDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckoutDate);

      endController.text = _formattedCheckOutDate!;
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
                text: 'Profit And Loss',
                fontWeight: FontWeight.w700,
                fontSize: 24.2.sp,
                color: AppColor.white,
              ),
              SizedBox(
                height: 42.h,
              ),
              TextFormWidget(
                  hint: 'Start',
                  hintColor: AppColor.white,
                  label: 'DD/MM/YYYY',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey),
                  fillColor: AppColor.white,
                  isFilled: true,
                  readOnly: true,
                  suffixWidget: IconButton(
                      onPressed: () => selectCheckInDate(context),
                      icon: Icon(
                        Icons.edit_calendar_rounded,
                        size: 20.sp,
                        color: AppColor.deeperprimary,
                      )),
                  controller: startController,
                  validator: AppValidator.validateString()),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'End',
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
                    onPressed: () => selectCheckOutDate(context),
                    icon: Icon(
                      Icons.edit_calendar_rounded,
                      size: 20.sp,
                      color: AppColor.deeperprimary,
                    )),
                controller: endController,
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
                            model.profitAndLoss(
                                context,
                                ProfitAndLossEntityModel(
                                  start: startController.text.trim(),
                                  end: endController.text.trim(),
                                ));
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
