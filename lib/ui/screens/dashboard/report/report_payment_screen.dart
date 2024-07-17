// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/model/payment_entity_model.dart';
import 'package:roomstatus/core/constants.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/report_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';
import '../../../widgets/text_widget.dart';

class ReportPaymentScreen extends StatelessWidget {
  ReportPaymentScreen(
      {super.key, required this.name, required this.amount, required this.id});
  String? name;
  String? id;
  String? amount;
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: ViewModelBuilder<ReportViewModel>.reactive(
          viewModelBuilder: () => locator<ReportViewModel>(),
          disposeViewModel: false,
          onViewModelReady: (model) {},
          builder: (_, ReportViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 42.h,
                      ),
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
                        text: 'Payment',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.2.sp,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 27.4.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 20.w, horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 171, 166),
                          borderRadius: BorderRadius.circular(17.2.w),
                        ),
                        child: Column(
                          children: [
                            TextView(
                              text: name ?? "",
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              fontSize: 17.2.sp,
                              color: AppColor.black,
                            ),
                            SizedBox(
                              height: 16.2.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 35.w),
                              decoration: BoxDecoration(
                                color: AppColor.deepprimary,
                                borderRadius: BorderRadius.circular(12.2.w),
                              ),
                              child: TextView(
                                text:
                                    '${getCurrency()}${oCcy.format(int.parse(amount!))}',
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center,
                                fontSize: 17.2.sp,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.2.h,
                      ),
                      TextFormWidget(
                        hint: 'Amount',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: amountController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 106.0.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Pay',
                          color: AppColor.white,
                          border: 24,
                          isLoading: model.isLoading,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.deepprimary,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.makePay(
                                  context,
                                  PaymentEntityModel(
                                      amountPaid: amountController.text.trim()),
                                  id!);
                            }
                          }),
                      SizedBox(
                        height: 26.0.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Notify',
                          color: AppColor.white,
                          border: 24,
                          isLoading: model.isLoading,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.transparent,
                          buttonBorderColor: AppColor.deeperprimary,
                          onPressed: () {
                            model.corporateNotifyAccount(context, id!);
                          }),
                      SizedBox(
                        height: 16.0.h,
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
