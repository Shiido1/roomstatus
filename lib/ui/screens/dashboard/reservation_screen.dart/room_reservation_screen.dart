// ignore_for_file: must_be_immutable

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:roomstatus/core/connect_end/view_model/auth_view_model.dart';
import 'package:roomstatus/ui/screens/dashboard/reservation_screen.dart/reservation_detail/reservation_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/image.dart';
import '../../../widgets/text_widget.dart';

class RoomReservationScreen extends StatelessWidget {
   RoomReservationScreen({super.key});

  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 88, 78),
      body: ViewModelBuilder<BookingViewModel>.reactive(
          viewModelBuilder: () => locator<BookingViewModel>(),
          disposeViewModel: false,
          initialiseSpecialViewModelsOnce: true,
          fireOnViewModelReadyOnce: true,
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getBookings(context);
            });
          },
          builder: (_, BookingViewModel model, __) {
            return SmartRefresher(
              controller: refreshController,
              key: const PageStorageKey('storage_key_sales'),
              enablePullUp: false,
              enablePullDown: true,
              onRefresh: () async {
                await model.getBookings(context);
                refreshController.refreshCompleted();
              },
              onLoading: () async {
                await model.getBookings(context);
                refreshController.loadComplete();
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    ViewModelBuilder<AuthViewModel>.reactive(
                        viewModelBuilder: () => locator<AuthViewModel>(),
                        disposeViewModel: false,
                        onViewModelReady: (mode) async {
                          await mode.profile(context);
                        },
                        builder: (_, AuthViewModel mode, __) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Reservations',
                                fontWeight: FontWeight.w700,
                                fontSize: 21.2.sp,
                                color: AppColor.white,
                              ),
                              SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.notification,
                                      color: AppColor.white,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    mode.getProfileResponseModel?.data
                                                ?.hotelLogo ==
                                            null
                                        ? GestureDetector(
                                            onTap: () => mode
                                                .displaylogoutModalBottomSheet(
                                                    context),
                                            child: Container(
                                              padding: EdgeInsets.all(12.w),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColor.white),
                                                shape: BoxShape.circle,
                                                color: AppColor.fadeddeepprimary,
                                              ),
                                              child: SvgPicture.asset(
                                                  AppImage.profile),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () => mode
                                                .displaylogoutModalBottomSheet(
                                                    context),
                                            child: Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(mode
                                                            .getProfileResponseModel
                                                            ?.data
                                                            ?.hotelLogo ??
                                                        ''),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (model.isLoading ||
                        model.getAllBookingsResponsemodel == null)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                        ),
                      )
                    else if (model.getAllBookingsResponsemodel!.bookings!.isEmpty)
                      Center(
                        child: TextView(
                          text: 'No History',
                          fontSize: 20.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    else if (model.getAllBookingsResponsemodel != null &&
                        model.getAllBookingsResponsemodel!.bookings!.isNotEmpty)
                      ...model.getAllBookingsResponsemodel!.bookings!.reversed
                          .map((e) => reversedContent(
                                code: e.code ?? '',
                                customerName: e.customer ?? '',
                                phn: e.phone ?? '',
                                image: e.image ?? '',
                                checkIn: e.checkedIn ?? '',
                                checkOut: e.checkedOut ?? '',
                              )),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  reversedContent({
    String? customerName,
    String? phn,
    String? code,
    String? image,
    String? checkIn,
    String? checkOut,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => ReservationDetails(
                  code: code,
                  image: image,
                ),
            transition: Transition.downToUp,
            duration: const Duration(seconds: 1));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.w),
        padding:
            EdgeInsets.only(top: 8.w, bottom: 8.w, left: 10.6.w, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120.w,
                  child: TextView(
                    text: customerName ?? '',
                    maxLines: 1,
                    textOverflow: TextOverflow.clip,
                    fontSize: 15.2.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                TextView(
                  text: phn ?? '',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 11.2.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 12.w,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 8.w, right: 8.w, top: 3.4.w, bottom: 3.4.w),
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(22)),
                          child: TextView(
                            text: 'Check In',
                            maxLines: 1,
                            textOverflow: TextOverflow.clip,
                            fontSize: 10.2.sp,
                            color: AppColor.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextView(
                          text: checkIn ?? '',
                          fontSize: 13.2.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 8.w, right: 8.w, top: 3.4.w, bottom: 3.4.w),
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(22)),
                          child: TextView(
                            text: 'Check Out',
                            maxLines: 1,
                            textOverflow: TextOverflow.clip,
                            fontSize: 10.2.sp,
                            color: AppColor.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextView(
                          text: checkOut ?? '',
                          fontSize: 13.2.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    image ?? '',
                    fit: BoxFit.cover,
                    height: 52.h,
                    width: 70.w,
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 2.4.w, bottom: 2.4.w),
                  decoration: BoxDecoration(
                      color: AppColor.deepprimary,
                      borderRadius: BorderRadius.circular(22)),
                  child: TextView(
                    text: 'View',
                    maxLines: 1,
                    textOverflow: TextOverflow.clip,
                    fontSize: 13.2.sp,
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
