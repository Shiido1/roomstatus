// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:roomstatus/core/connect_end/model/login_entity_model.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/screens/authentication/create_account/create_account_screen.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';

class UserLoginScreen extends StatefulWidget {
  UserLoginScreen({
    super.key,
  });

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController hotelCodeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.text = '';
    hotelCodeController.text = '';
    passwordController.text = '';
    super.dispose();
  }

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
                  key: formKeyLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      TextView(
                        text: 'User Authentication',
                        fontSize: 23.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Hotel Code',
                        hintColor: AppColor.white,
                        label: 'Select service',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: hotelCodeController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Username',
                        fillColor: AppColor.white,
                        hintColor: AppColor.white,
                        isFilled: true,
                        controller: usernameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Password',
                        fillColor: AppColor.white,
                        hintColor: AppColor.white,
                        isFilled: true,
                        controller: passwordController,
                        validator: AppValidator.validateString(),
                        suffixIcon: !model.isTogglePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: !model.isTogglePassword,
                        onPasswordToggle: model.isOnTogglePassword,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Sign in',
                          color: AppColor.white,
                          border: 24,
                          isLoading: model.isLoading,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.deepprimary,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKeyLogin.currentState!.validate()) {
                              model.loginUser(
                                  LoginEntityModel(
                                      code: hotelCodeController.text.trim(),
                                      username: usernameController.text.trim(),
                                      password: passwordController.text.trim(),
                                      deviceName: Platform.isAndroid
                                          ? 'android'
                                          : 'ios'),
                                  context);
                            }
                          }),
                      SizedBox(
                        height: 140.h,
                      ),
                      TextView(
                        text: 'Do you own hotel / Motel or Apartment? ',
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Create an Account',
                          color: AppColor.white,
                          border: 24,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.transparent,
                          buttonBorderColor: AppColor.deepprimary,
                          onPressed: () {
                            Get.to(() => const CreateAccountScreen(),
                                transition: Transition.fadeIn,
                                duration: const Duration(seconds: 2));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
