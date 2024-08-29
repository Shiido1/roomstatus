import 'package:roomstatus/core/connect_end/model/update_booking_entity_model.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../app_assets/app_validation.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/text_form_widget.dart';
import '../../../../widgets/text_widget.dart';

TextEditingController checkInController = TextEditingController();
TextEditingController checkOutController = TextEditingController();
TextEditingController discountController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController paymodeController = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

DateTime selectedCheckinDate = DateTime.now();

DateTime selectedCheckoutDate = DateTime.now();

bool onTap = false;

String? _formattedCheckInDate =
    DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

String? _formattedCheckOutDate =
    DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

Future<void> selectCheckInDate(BuildContext? context) async {
  final DateTime? picked = await showDatePicker(
      context: context!,
      initialDate: selectedCheckinDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedCheckinDate) {
    selectedCheckinDate = picked;
    _formattedCheckInDate =
        DateFormat('yyyy-MM-dd').format(selectedCheckinDate);

    checkInController.text = _formattedCheckInDate!;
  }
}

Future<void> selectCheckOutDate(BuildContext? context) async {
  final DateTime? picked = await showDatePicker(
      context: context!,
      initialDate: selectedCheckoutDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedCheckoutDate) {
    selectedCheckoutDate = picked;
    _formattedCheckOutDate =
        DateFormat('yyyy-MM-dd').format(selectedCheckoutDate);

    checkOutController.text = _formattedCheckOutDate!;
  }
}

void displayEditModalBottomSheet({BuildContext? context, String? code}) {
  showModalBottomSheet(
      backgroundColor: AppColor.primary,
      context: context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      builder: (context) => ViewModelBuilder<BookingViewModel>.reactive(
          viewModelBuilder: () => locator<BookingViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.showBooking(context, code);

              DateFormat checkInInputFormat = DateFormat('dd MMM, yyyy');

              // Parse the input date string to a DateTime object
              DateTime checkInDateTime = checkInInputFormat
                  .parse(model.showBookingResponseModel?.data?.checkedIn ?? '');

              // Define the output format
              DateFormat checkInOutputFormat = DateFormat('yyyy-MM-dd');

              // Format the DateTime object to the desired output format
              String checkInText = checkInOutputFormat.format(checkInDateTime);

              DateFormat checkOutOutputFormat = DateFormat('dd MMM, yyyy');

              // Parse the input date string to a DateTime object
              DateTime checkOutDateTime = checkOutOutputFormat.parse(
                  model.showBookingResponseModel?.data?.checkedOut ?? '');

              DateFormat checkOutFormat = DateFormat('yyyy-MM-dd');
              // Format the DateTime object to the desired output format
              String checkOutText = checkOutFormat.format(checkOutDateTime);

              amountController.text =
                  model.showBookingResponseModel!.data!.amountPaid.toString();
              discountController.text =
                  model.showBookingResponseModel!.data!.discount.toString();
              paymodeController.text =
                  model.showBookingResponseModel?.data?.modeOfPayment ?? '';
              checkInController.text = checkInText;

              checkOutController.text = checkOutText;
            });
          },
          disposeViewModel: false,
          builder: (_, BookingViewModel model, __) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: .4,
              maxChildSize: .99,
              minChildSize: .32,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: 70.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextView(
                          text: 'Edit Booking',
                          fontSize: 22.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          height: 14.2.h,
                        ),
                        Container(
                          color: AppColor.fadeddeepprimary.withOpacity(.4),
                          padding: EdgeInsets.all(8.w),
                          child: TextView(
                            text: '250 (Standard) ₦100,000.00',
                            fontSize: 16.8.sp,
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 22.2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                TextFormWidget(
                                    hint: 'Check-In Date',
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
                                        onPressed: () =>
                                            selectCheckInDate(context),
                                        icon: Icon(
                                          Icons.edit_calendar_rounded,
                                          size: 20.sp,
                                          color: AppColor.deeperprimary,
                                        )),
                                    controller: checkInController,
                                    validator: AppValidator.validateString()),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormWidget(
                                  hint: 'Check-Out Date',
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
                                      onPressed: () =>
                                          selectCheckOutDate(context),
                                      icon: Icon(
                                        Icons.edit_calendar_rounded,
                                        size: 20.sp,
                                        color: AppColor.deeperprimary,
                                      )),
                                  controller: checkOutController,
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormWidget(
                                  hint: 'Discount (%)',
                                  label: '',
                                  hintColor: AppColor.white,
                                  keyboardType: TextInputType.number,
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.2.sp,
                                      color: AppColor.inGrey),
                                  fillColor: AppColor.white,
                                  isFilled: true,
                                  controller: discountController,
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormWidget(
                                  hint: 'Amount Paid',
                                  label: '',
                                  hintColor: AppColor.white,
                                  keyboardType: TextInputType.number,
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
                                  height: 20.h,
                                ),
                                ViewModelBuilder<BookingViewModel>.reactive(
                                    viewModelBuilder: () => BookingViewModel(),
                                    onViewModelReady: (model) {
                                      model.paymentModel(context);
                                    },
                                    disposeViewModel: false,
                                    builder: (_, BookingViewModel model, __) {
                                      return Column(
                                        children: [
                                          TextFormWidget(
                                            hint: 'Mode of Payment',
                                            label: '',
                                            hintColor: AppColor.white,
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
                                                  model.notifyListeners();
                                                },
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  size: 26.sp,
                                                )),
                                            controller: paymodeController,
                                            validator:
                                                AppValidator.validateString(),
                                          ),
                                          SizedBox(
                                            height: !onTap ? 0.h : 16.h,
                                          ),
                                          !onTap
                                              ? const SizedBox.shrink()
                                              : Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16.w,
                                                      horizontal: 10.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.r),
                                                    color: AppColor.white,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ...model
                                                          .paymentModeResponseModel!
                                                          .data!
                                                          .map((o) => Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10.w),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    paymodeController
                                                                        .text = o;
                                                                    onTap =
                                                                        false;
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child:
                                                                      TextView(
                                                                    text: o,
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ))
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      );
                                    }),
                                SizedBox(
                                  height: 40.h,
                                ),
                                ButtonWidget(
                                    buttonText: 'Proceed',
                                    color: AppColor.white,
                                    border: 24,
                                    isLoading: model.isLoading,
                                    buttonWidth: double.infinity,
                                    buttonColor: AppColor.deepprimary,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        model.updateBooking(
                                            code: code,
                                            contxt: context,
                                            updateEntity:
                                                UpdateBookingEntityModel(
                                              amountPaid:
                                                  amountController.text.trim(),
                                              checkedIn:
                                                  checkInController.text.trim(),
                                              checkedOut: checkOutController
                                                  .text
                                                  .trim(),
                                              modeOfPayment:
                                                  paymodeController.text.trim(),
                                              discount: discountController.text
                                                  .trim(),
                                            ));
                                      }
                                    }),
                                SizedBox(
                                  height: 16.0.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }));
}

void displayBookingModalBottomSheet({BuildContext? context, String? code}) {
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 243, 139, 132),
      context: context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      builder: (context) => ViewModelBuilder<BookingViewModel>.reactive(
          viewModelBuilder: () => locator<BookingViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, BookingViewModel model, __) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: .3,
              maxChildSize: .39,
              minChildSize: .22,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 70.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(
                        height: 17.2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => displayEditModalBottomSheet(
                                context: context, code: code),
                            child: TextView(
                              text: 'Edit Booking',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            color: AppColor.white,
                            thickness: .4.sp,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GestureDetector(
                            onTap: () => model.checkInBooking(context, code),
                            child: TextView(
                              text: 'Check In',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            color: AppColor.white,
                            thickness: .4.sp,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GestureDetector(
                            onTap: () => model.checkOutBooking(context, code),
                            child: TextView(
                              text: 'Check Out',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }));
}
