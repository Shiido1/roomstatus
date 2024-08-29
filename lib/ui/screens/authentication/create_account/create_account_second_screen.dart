import 'package:roomstatus/core/connect_end/model/registration_entity_model.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/screens/authentication/create_account/create_account_second_screen.form.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:dio/dio.dart' as file;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';
import '../login/user_login_screen.dart';

@FormView(fields: [
  FormTextField(name: 'first_name'),
  FormTextField(name: 'last_name'),
  FormTextField(name: 'telephone'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'pasword_confirm'),
])
// ignore: must_be_immutable
class CreateAccountSecondScreen extends StatelessWidget
    with $CreateAccountSecondScreen {
  CreateAccountSecondScreen({
    super.key,
    required this.address,
    required this.hotelname,
    required this.city,
    required this.state,
    required this.country,
  });

  String? hotelname;
  String? country;
  String? state;
  String? city;
  String? address;

  GlobalKey<FormState> formKeyRegisterSecond = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) async {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.primary,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
              child: Center(
                child: Form(
                  key: formKeyRegisterSecond,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      TextView(
                        text: 'Create an Account',
                        fontSize: 23.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SvgPicture.asset(AppImage.createvectwo),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Hotel Information',
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                          TextView(
                            text: 'Personal Information',
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'First Name',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: firstNameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Last Name',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: lastNameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Telephone',
                        hintColor: AppColor.white,
                        keyboardType: TextInputType.number,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: telephoneController,
                        validator: AppValidator.validateInt(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Email Address',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: emailController,
                        validator: AppValidator.validateEmail(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                          hint: 'Password',
                          hintColor: AppColor.white,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.2.sp,
                              color: AppColor.inGrey),
                          fillColor: AppColor.white,
                          isFilled: true,
                          suffixIconColor: AppColor.black,
                          controller: passwordController,
                          suffixIcon: !model.isTogglePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onPasswordToggle: model.isOnTogglePassword,
                          obscureText: !model.isTogglePassword,
                          validator: AppValidator.validatePlainPass()),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Confirm Password',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        suffixIcon: !model.isTogglePasswordConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        controller: paswordConfirmController,
                        suffixIconColor: AppColor.black,
                        onPasswordToggle: model.isOnTogglePasswordConfirm,
                        obscureText: !model.isTogglePasswordConfirm,
                        validator: AppValidator.confirmValidatePassword(
                            passwordController1: passwordController,
                            passwordController2: paswordConfirmController),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Proceed',
                          color: AppColor.white,
                          border: 24,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.deepprimary,
                          isLoading: model.isLoading,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKeyRegisterSecond.currentState!
                                .validate()) {
                              model.signUpUser(
                                  RegistrationEntityModel(
                                      name: hotelname,
                                      address: address,
                                      countryId: country,
                                      cityId: city,
                                      stateId: state,
                                      telephone:
                                          telephoneController.text.trim(),
                                      email: emailController.text.trim(),
                                      firstname:
                                          firstNameController.text.trim(),
                                      lastname: lastNameController.text.trim(),
                                      password: passwordController.text.trim(),
                                      passwordConfirmation:
                                          paswordConfirmController.text.trim(),
                                      logo: file.MultipartFile.fromBytes(
                                          model
                                              .formartFileImage(model.imageFile)
                                              .readAsBytesSync(),
                                          filename: model.imageFile!.path
                                              .split("/")
                                              .last)),
                                  context);
                            }
                          }),
                      SizedBox(
                        height: 18.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => UserLoginScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(seconds: 2));
                        },
                        child: TextView(
                          text: 'Already have an Account Login here',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(
                        height: 16.0.h,
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
