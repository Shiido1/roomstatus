// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/model/report_room_response_model/booking.dart';
import 'package:roomstatus/core/connect_end/view_model/report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constants.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../widgets/text_widget.dart';

class ReportRoomScreen extends StatelessWidget {
  const ReportRoomScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportViewModel>.reactive(
        viewModelBuilder: () => locator<ReportViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) {},
        builder: (_, ReportViewModel model, __) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 208, 114, 108),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 26.8.sp,
                        color: AppColor.white,
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextView(
                    text: "Room Report",
                    fontWeight: FontWeight.w700,
                    fontSize: 25.2.sp,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.w, horizontal: 6.w),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextView(
                                text: "Total Due",
                                fontWeight: FontWeight.w600,
                                fontSize: 14.2.sp,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text:
                                  '${getCurrency()}${oCcy.format(model.reportRoomResponseModel?.data?.grossTotalDue ?? 0)}',
                              fontWeight: FontWeight.w800,
                              fontSize: 13.2.sp,
                              color: AppColor.white,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextView(
                                text: "Amount Received",
                                fontWeight: FontWeight.w600,
                                fontSize: 14.2.sp,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text:
                                  '${getCurrency()}${oCcy.format(model.reportRoomResponseModel?.data?.totalAmountReceived ?? 0)}',
                              fontWeight: FontWeight.w800,
                              fontSize: 13.2.sp,
                              color: AppColor.white,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6.4.w),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextView(
                                text: "Balance",
                                fontWeight: FontWeight.w600,
                                fontSize: 14.2.sp,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text:
                                  '${getCurrency()}${oCcy.format(model.reportRoomResponseModel?.data?.balanceNet ?? 0)}',
                              fontWeight: FontWeight.w800,
                              fontSize: 13.2.sp,
                              color: AppColor.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  if (model.isLoading!)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.white,
                      ),
                    )
                  else if (model.reportRoomResponseModel != null &&
                      model.reportRoomResponseModel!.data!.bookings!.isNotEmpty)
                    ...model.reportRoomResponseModel!.data!.bookings!
                        .map((e) => reversedContent(
                              e,
                            )),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          );
        });
  }

  reversedContent(Booking book) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //     () => SingleSaleDetailsScreen(
        //           code: book.code,
        //         ),
        //     transition: Transition.downToUp,
        //     duration: const Duration(seconds: 1));
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
                    text: book.customer ?? '',
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
                  text: book.phone ?? '',
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
                            text: 'Check in',
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
                          text: book.checkedIn ?? '',
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
                            text: 'Check out',
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
                          text: book.checkedOut ?? '',
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
                    book.image ?? '',
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
