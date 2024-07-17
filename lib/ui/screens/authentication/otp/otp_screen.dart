import 'package:roomstatus/core/connect_end/model/otp_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/resent_otp_entity_model.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/screens/authentication/otp/otp_screen.form.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';

@FormView(fields: [
  FormTextField(name: 'otp'),
])
// ignore: must_be_immutable
class OTPScreen extends StatelessWidget with $OTPScreen {
  OTPScreen({super.key, required this.email});
  String? email;
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.primary,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
              child: Center(
                child: Form(
                  key: formKeyValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      TextView(
                          text: 'OTP Verification',
                          fontSize: 23.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextView(
                          text:
                              'Kindly check your email for the otp. You can check your spam folder if not found in inbox',
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.white),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextView(
                          text: email!,
                          fontSize: 17.0.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.white),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'OTP',
                        label: 'Enter Code',
                        hintColor: AppColor.white,
                        keyboardType: TextInputType.number,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: otpController,
                        validator: AppValidator.validateInt(),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Confirm',
                          color: AppColor.white,
                          border: 24,
                          isLoading: model.isLoading,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.deepprimary,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKeyValidate.currentState!.validate()) {
                              model.otpVerify(
                                  OtpEntityModel(
                                    email: email,
                                    otp: otpController.text.trim(),
                                  ),
                                  context);
                            }
                          }),
                      SizedBox(
                        height: 260.h,
                      ),
                      TextView(
                          text: 'Wait for 5 minutes to resend the OTP again ',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Resend Otp',
                          color: AppColor.white,
                          border: 24,
                          isLoading: model.isLoadingResend,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.transparent,
                          buttonBorderColor: AppColor.deepprimary,
                          onPressed: () => model.resend(
                              ResentOtpEntityModel(email: email), context)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
