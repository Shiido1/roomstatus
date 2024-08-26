import 'package:roomstatus/ui/screens/dashboard/tab_widget/widgets/show_bottom_modal.dart';
import 'package:roomstatus/ui/widgets/print_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../../core/core_folder/app/app.router.dart';
import '../../../../../main.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/image.dart';
import '../../../../widgets/text_widget.dart';
import '../../dashboard_screen.dart';

// ignore: must_be_immutable
class ReservationDetails extends StatelessWidget {
  ReservationDetails({super.key, required this.code, required this.image});
  String? code;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 102, 93),
      body: ViewModelBuilder<BookingViewModel>.reactive(
          viewModelBuilder: () => locator<BookingViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              model.showBooking(context, code);
            });
          },
          disposeViewModel: false,
          builder: (_, BookingViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 16.w),
              child: model.isLoading || model.showBookingResponseModel == null
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 80.w),
                        child: const CircularProgressIndicator(
                          color: AppColor.white,
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 24.sp,
                              color: AppColor.white,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Reservation Detail',
                              fontWeight: FontWeight.w700,
                              fontSize: 21.2.sp,
                              color: AppColor.white,
                            ),
                            SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () =>
                                          displayBookingModalBottomSheet(
                                              context: context, code: code),
                                      child: SvgPicture.asset(AppImage.edit)),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  GestureDetector(
                                      onTap: () =>
                                          model.showAlertDialog(context, code!),
                                      child: SvgPicture.asset(AppImage.delete))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            model.showBookingResponseModel?.data?.image ??
                                image ??
                                '',
                            fit: BoxFit.cover,
                            height: 202.h,
                            width: double.infinity.w,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: model.showBookingResponseModel?.data
                                      ?.bookedItem ??
                                  '',
                              fontWeight: FontWeight.w600,
                              fontSize: 18.2.sp,
                              color: AppColor.white,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text:
                                      '${getCurrency()}${oCcy.format(model.showBookingResponseModel?.data?.price ?? 0)}',
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.white,
                                  fontSize: 22.2.sp,
                                ),
                                model.showBookingResponseModel!.data!
                                            .modeOfPayment!
                                            .toLowerCase() ==
                                        'POS'.toLowerCase()
                                    ? IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text:
                                                  '${model.showBookingResponseModel?.data?.price}'));
                                        },
                                        icon: Icon(
                                          Icons.copy,
                                          size: 16.8.sp,
                                          color: AppColor.white,
                                        ))
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 15.2.w, horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.deepprimary,
                          ),
                          child: Column(
                            children: [
                              TextView(
                                text: model.showBookingResponseModel?.data
                                        ?.customer ??
                                    '',
                                fontWeight: FontWeight.w700,
                                fontSize: 21.2.sp,
                                color: AppColor.white,
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              TextView(
                                text: model.showBookingResponseModel?.data
                                        ?.phone ??
                                    '',
                                fontWeight: FontWeight.w400,
                                fontSize: 15.2.sp,
                                color: AppColor.white,
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              TextView(
                                text: model.showBookingResponseModel?.data
                                        ?.email ??
                                    '',
                                fontWeight: FontWeight.w400,
                                fontSize: 15.2.sp,
                                color: AppColor.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.w, horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Checked-In',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextView(
                                    text: model.showBookingResponseModel?.data
                                            ?.checkedIn ??
                                        '',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Checked-Out',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextView(
                                    text: model.showBookingResponseModel?.data
                                            ?.checkedOut ??
                                        '',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.w, horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Discount(%)',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextView(
                                    text: model.showBookingResponseModel?.data
                                            ?.discount
                                            .toString() ??
                                        '',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Due',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextView(
                                    text:
                                        '${getCurrency()}${oCcy.format(model.showBookingResponseModel?.data?.due ?? 0)}',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Total Amount paid',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey,
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextView(
                                    text:
                                        '${getCurrency()}${oCcy.format(model.showBookingResponseModel?.data?.amountPaid ?? 0)}',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        PrintButtonWidget(
                            buttonText: 'Make Payment',
                            color: AppColor.white,
                            border: 24,
                            widget: SvgPicture.asset(
                              AppImage.pPos,
                              color: AppColor.white,
                            ),
                            buttonWidth: double.infinity,
                            buttonColor: AppColor.transparent,
                            buttonBorderColor: AppColor.white,
                            onPressed: () => navigate.clearStackAndShow(Routes.dashboard, arguments: const Dashboard())
                            // model.printReceiptWidget()
                            ),
                      ],
                    ),
            );
          }),
    );
  }
}
