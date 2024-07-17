import 'package:roomstatus/core/connect_end/model/add_booking_entity_model.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';

// ignore: must_be_immutable
class AddBookingSecondScreen extends StatefulWidget {
  AddBookingSecondScreen(
      {super.key,
      required this.id,
      required this.amount,
      required this.checkIn,
      required this.checkOut,
      required this.discount,
      required this.paymode});

  String? id;
  String? checkIn;
  String? checkOut;
  String? discount;
  String? amount;
  String? paymode;

  @override
  State<AddBookingSecondScreen> createState() => _AddBookingSecondScreenState();
}

class _AddBookingSecondScreenState extends State<AddBookingSecondScreen> {
  bool onIdTap = false;
  bool onGenderTap = false;
  bool onStateTap = false;
  bool onCityTap = false;
  bool onCompanyTap = false;

  String? stateid;
  String? cityid;
  String? businessId;

  List<String> genderList = ['Male', "Female"];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController custIdController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    firstnameController.text = '';
    lastNameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    custIdController.text = '';
    idNumberController.text = '';
    genderController.text = '';
    stateController.text = '';
    addressController.text = '';
    companyController.text = '';
    cityController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingViewModel>.reactive(
        viewModelBuilder: () => locator<BookingViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getIdCards(context);
            model.getState(context);
            model.getCorporateCompanies(context);
          });
        },
        disposeViewModel: false,
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
                                    text: '250 ',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.2.sp)),
                                TextSpan(
                                    text: 'ROOM TYPE: ',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.2.sp)),
                                TextSpan(
                                    text: 'STANDARD ',
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
                        padding: EdgeInsets.all(18.w),
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImage.createvectwo),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Booking Details',
                                  fontSize: 15.0.sp,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextView(
                                  text: 'customer Info',
                                  fontSize: 15.0.sp,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextFormWidget(
                              label: 'Find Customer',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.black),
                              fillColor:
                                  const Color.fromARGB(255, 212, 199, 198)
                                      .withOpacity(.4),
                              isFilled: true,
                              prefixWidget: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: SvgPicture.asset(
                                  AppImage.search,
                                ),
                              ),
                              onChange: (p0) async {
                                if (p0.length > 10) {
                                  await model.findCustomer(context, p0);
                                  setState(() {
                                    firstnameController.text =
                                        model.findCustomerData?.firstname ?? '';
                                    lastNameController.text =
                                        model.findCustomerData?.lastname ?? '';
                                    phoneController.text =
                                        model.findCustomerData?.phone ?? '';
                                    emailController.text =
                                        model.findCustomerData?.email ?? '';
                                    custIdController.text =
                                        model.findCustomerData?.idType ?? '';
                                    idNumberController.text =
                                        model.findCustomerData?.idNumber ?? '';
                                    stateController.text =
                                        model.findCustomerData?.stateId ?? '';
                                    cityController.text =
                                        model.findCustomerData?.cityId ?? '';
                                    addressController.text =
                                        model.findCustomerData?.address ?? '';
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'First Name',
                              label: 'Select service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: firstnameController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Last Name',
                              label: 'Select service',
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
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Email Address',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: emailController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Customer\'s ID',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: custIdController,
                              validator: AppValidator.validateString(),
                              readOnly: true,
                              suffixWidget: IconButton(
                                  onPressed: () {
                                    onIdTap = !onIdTap;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 26.sp,
                                  )),
                            ),
                            SizedBox(
                              height: !onIdTap ? 0.h : 16.h,
                            ),
                            !onIdTap
                                ? const SizedBox.shrink()
                                : Container(
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
                                        ...model.cardResponse!.data!.map((o) =>
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  custIdController.text = o;
                                                  onIdTap = false;
                                                  setState(() {});
                                                },
                                                child: TextView(
                                                  text: o,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'ID Card Number',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: idNumberController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Customer\'s Gender',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              readOnly: true,
                              controller: genderController,
                              suffixWidget: IconButton(
                                  onPressed: () {
                                    onGenderTap = !onGenderTap;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 26.sp,
                                  )),
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: !onGenderTap ? 0.h : 16.h,
                            ),
                            !onGenderTap
                                ? const SizedBox.shrink()
                                : Container(
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
                                        ...genderList.map((o) => Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  genderController.text = o;
                                                  onGenderTap = false;
                                                  setState(() {});
                                                },
                                                child: TextView(
                                                  text: o,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'State',
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
                                    onStateTap = !onStateTap;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 26.sp,
                                  )),
                              controller: stateController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: !onStateTap ? 0.h : 16.h,
                            ),
                            !onStateTap
                                ? const SizedBox.shrink()
                                : Container(
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
                                        if (model.stateModel != null)
                                          ...model.stateModel!.data!
                                              .map((o) => Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.w),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        stateController.text =
                                                            o.name!;
                                                        stateid =
                                                            o.id.toString();
                                                        onStateTap = false;
                                                        setState(() {});
                                                      },
                                                      child: TextView(
                                                        text: o.name ?? '',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ))
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'City Town',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              suffixWidget: model.isLoadingCity
                                  ? SpinKitRipple(
                                      color: AppColor.deepprimary,
                                      size: 20.sp,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        onCityTap = !onCityTap;
                                        model.getCities(context, stateid);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 26.sp,
                                      )),
                              controller: cityController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: !onCityTap ? 0.h : 16.h,
                            ),
                            !onCityTap
                                ? const SizedBox.shrink()
                                : Container(
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
                                        if (model.cityModel != null &&
                                            model.cityModel!.data!.isNotEmpty)
                                          ...model.cityModel!.data!
                                              .map((o) => Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.w),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        cityController.text =
                                                            o.name!;
                                                        cityid =
                                                            o.id.toString();
                                                        onCityTap = false;
                                                        setState(() {});
                                                      },
                                                      child: TextView(
                                                        text: o.name ?? '',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ))
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'Address',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              controller: addressController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormWidget(
                              hint: 'If Credit Customer, select Company',
                              label: 'Select Service',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.2.sp,
                                  color: AppColor.inGrey),
                              fillColor: AppColor.white,
                              isFilled: true,
                              suffixWidget: model.isLoadingCity
                                  ? SpinKitRipple(
                                      color: AppColor.deepprimary,
                                      size: 20.sp,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        onCompanyTap = !onCompanyTap;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 26.sp,
                                      )),
                              controller: companyController,
                            ),
                            SizedBox(
                              height: !onCompanyTap ? 0.h : 16.h,
                            ),
                            !onCompanyTap
                                ? const SizedBox.shrink()
                                : Container(
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
                                        if (model.corpCompanyModel != null &&
                                            model.corpCompanyModel!.data!
                                                .isNotEmpty)
                                          ...model.corpCompanyModel!.data!
                                              .map((o) => Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.w),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        companyController.text =
                                                            o.name!;
                                                        businessId =
                                                            o.id.toString();
                                                        onCompanyTap = false;
                                                        setState(() {});
                                                      },
                                                      child: TextView(
                                                        text: o.name ?? '',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ))
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 40.h,
                            ),
                            ButtonWidget(
                                buttonText: 'Book Reservation',
                                color: AppColor.white,
                                border: 24,
                                buttonWidth: double.infinity,
                                buttonColor: AppColor.deepprimary,
                                buttonBorderColor: Colors.transparent,
                                isLoading: model.isLoading,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    model.addBooking(
                                        id: widget.id,
                                        contxt: context,
                                        entity: AddBookingEntityModel(
                                          firstname:
                                              firstnameController.text.trim(),
                                          lastname:
                                              lastNameController.text.trim(),
                                          email: emailController.text.trim(),
                                          phone: phoneController.text.trim(),
                                          address:
                                              addressController.text.trim(),
                                          businessId: businessId ??
                                              companyController.text,
                                          idNumber:
                                              idNumberController.text.trim(),
                                          idType: custIdController.text.trim(),
                                          checkedIn: widget.checkIn,
                                          checkedOut: widget.checkOut,
                                          amountPaid: widget.amount,
                                          discount: widget.discount,
                                          modeOfPayment: widget.paymode,
                                          gender: genderController.text.trim(),
                                        ));
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
