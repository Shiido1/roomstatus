import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/screens/dashboard/add_booking/add_booking_screen.form.dart';
import 'package:roomstatus/ui/screens/dashboard/add_booking/add_booking_second_screen.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../core/constants.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';

@FormView(fields: [
  FormTextField(name: 'discount'),
  FormTextField(name: 'pay_mode'),
  FormTextField(name: 'amount'),
])
// ignore: must_be_immutable
class AddBookingScreen extends StatefulWidget with $AddBookingScreen {
  AddBookingScreen({super.key, required this.id});
  String? id;

  @override
  State<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends State<AddBookingScreen> {
  bool onTap = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.discountController.text = '';
    widget.amountController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingViewModel>.reactive(
        viewModelBuilder: () => locator<BookingViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.paymentModel(context);
            widget.discountController.text = '0';
          });
        },
        disposeViewModel: false,
        onDispose: (viewModel) {
          widget.discountController;
          widget.amountController;
          viewModel.checkInController.text = '';
          viewModel.checkOutController.text = '';
        },
        builder: (_, BookingViewModel model, __) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 159, 153),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 0.h),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 40.sp,
                                  color: AppColor.deeperprimary,
                                )),
                            TextView(
                              text: 'Add Booking',
                              fontSize: 25.2.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.white,
                            ),
                            Icon(
                              Icons.edit_calendar_rounded,
                              color: AppColor.deeperprimary,
                              size: 30.sp,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        color: AppColor.fadeddeepprimary.withOpacity(.4),
                        child: ScrollLoopAutoScroll(
                          scrollDirection: Axis.horizontal,
                          child: RichText(
                            text: TextSpan(
                              text: 'ROOM NUMBER: ',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.2.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '250',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.2.sp,
                                        color: AppColor.white)),
                                TextSpan(
                                    text: ' ROOM TYPE:',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.2.sp)),
                                TextSpan(
                                    text: 'STANDARD',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.2.sp)),
                                TextSpan(
                                    text: 'PROMO PRICE:',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.2.sp)),
                                TextSpan(
                                    text: ' ₦9,500.00',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.2.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImage.createvecone),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Booking Details',
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.black,
                                ),
                                TextView(
                                  text: 'customer Info',
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextFormWidget(
                              hint: 'Check-In Date',
                              label: 'DD/MM/YYYY',
                              readOnly: true,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              suffixWidget: IconButton(
                                  onPressed: () =>
                                      model.selectCheckInDate(context),
                                  icon: Icon(
                                    Icons.edit_calendar_rounded,
                                    size: 20.sp,
                                    color: AppColor.deeperprimary,
                                  )),
                              controller: model.checkInController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Check-Out Date',
                              label: 'DD/MM/YYYY',
                              readOnly: true,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              suffixWidget: IconButton(
                                  onPressed: () => model.selectCheckOutDate(
                                      context, widget.id!),
                                  icon: Icon(
                                    Icons.edit_calendar_rounded,
                                    size: 20.sp,
                                    color: AppColor.deeperprimary,
                                  )),
                              controller: model.checkOutController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Discount (%)',
                              label: 'Select Service',
                              keyboardType: TextInputType.number,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: widget.discountController,
                              // validator: AppValidator.validateInt(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            model.isDue == true
                                ? Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16.w, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: AppColor.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'Room Rate:',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text:
                                                  '${getCurrency()}${oCcy.format(model.getDuesResponseModel?.data?.roomRate ?? 0)}',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'Day(s):',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text:
                                                  '${model.getDuesResponseModel?.data?.dayS ?? 0}',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'Total Amount:',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text:
                                                  '${getCurrency()}${oCcy.format(model.getDuesResponseModel?.data?.totalAmount ?? 0)}',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'Dicount Price:',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text:
                                                  '${getCurrency()}${oCcy.format(model.getDuesResponseModel?.data?.discountPrice ?? 0)}',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'VAT:',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text: model.getDuesResponseModel
                                                      ?.data?.vat ??
                                                  '',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextView(
                                              text: 'Total Due:',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextView(
                                              text:
                                                  '${getCurrency()}${oCcy.format(model.getDuesResponseModel?.data?.totalDue ?? 0)}',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              height: !model.isDue! ? 10.h : 0.h,
                            ),
                            TextFormWidget(
                              hint: 'Amount Paid',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: widget.amountController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Column(
                              children: [
                                TextFormWidget(
                                  hint: 'Mode of Payment',
                                  label: 'Select Service',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.2.sp,
                                      color: AppColor.inGrey),
                                  fillColor: AppColor.white,
                                  isFilled: true,
                                  readOnly: true,
                                  suffixWidget: IconButton(
                                      onPressed: () {
                                        onTap = !onTap;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 26.sp,
                                      )),
                                  controller: widget.payModeController,
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(
                                  height: !onTap ? 0.h : 16.h,
                                ),
                                !onTap
                                    ? const SizedBox.shrink()
                                    : Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.w, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                          color: AppColor.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...model
                                                .paymentModeResponseModel!.data!
                                                .map((o) => Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.w),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          widget
                                                              .payModeController
                                                              .text = o;
                                                          onTap = false;
                                                          setState(() {});
                                                        },
                                                        child: TextView(
                                                          text: o,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                          ],
                                        ),
                                      ),
                              ],
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
                                buttonBorderColor: Colors.transparent,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    model.isDue = false;
                                    model.notifyListeners();
                                    Get.to(
                                        () => AddBookingSecondScreen(
                                              amount: widget
                                                  .amountController.text
                                                  .trim(),
                                              checkIn: model
                                                  .checkInController.text
                                                  .trim(),
                                              checkOut: model
                                                  .checkOutController.text
                                                  .trim(),
                                              discount: widget
                                                  .discountController.text
                                                  .trim(),
                                              paymode: widget
                                                  .payModeController.text
                                                  .trim(),
                                              id: widget.id,
                                            ),
                                        transition: Transition.fadeIn,
                                        duration: const Duration(seconds: 1));
                                  }
                                }),
                            SizedBox(
                              height: 16.0.h,
                            ),
                          ],
                        ),
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
