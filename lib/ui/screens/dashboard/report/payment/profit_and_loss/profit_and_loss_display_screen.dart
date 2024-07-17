// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import '../../../../../../core/constants.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../widgets/text_widget.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_repsonse_model/data.dart';

class ProfitAndLossDisplayScreen extends StatelessWidget {
  ProfitAndLossDisplayScreen({super.key, required this.data});
  Data? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 153, 147),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 26.sp,
                    color: AppColor.white,
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: TextView(
                text: 'Profit and Loss Report',
                fontWeight: FontWeight.w700,
                fontSize: 24.2.sp,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              color: AppColor.fadeddeepprimary.withOpacity(.4),
              child: ScrollLoopAutoScroll(
                scrollDirection: Axis.horizontal,
                child: RichText(
                  text: TextSpan(
                    text: 'PROFIT AND LOSS REPORT FROM ',
                    style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.2.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text: '2024-06-13',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.2.sp,
                              color: AppColor.white)),
                      TextSpan(
                          text: ' TO ',
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.2.sp)),
                      TextSpan(
                          text: '2024-07-07 ',
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.2.sp)),
                      TextSpan(
                          text: 'GENERATED ON',
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.2.sp)),
                      TextSpan(
                          text: ' 26 JUN, 2024',
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
              height: 24.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 22.w),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Source',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.2.sp,
                        color: AppColor.primary,
                      ),
                      TextView(
                        text: '	Amount(#)',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.2.sp,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Items Sales',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.2.sp,
                        color: AppColor.black,
                      ),
                      TextView(
                        text:
                            '${getCurrency()}${oCcy.format(data?.revenues?.orders ?? 0)}',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.2.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Room Reservation',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.2.sp,
                        color: AppColor.black,
                      ),
                      TextView(
                        text:
                            '${getCurrency()}${oCcy.format(data?.revenues?.room ?? 0)}',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.2.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Hall Reservation',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.2.sp,
                        color: AppColor.black,
                      ),
                      TextView(
                        text:
                            '${getCurrency()}${oCcy.format(data?.revenues?.hall ?? 0)}',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.2.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Total Revenue',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.2.sp,
                        color: AppColor.black,
                      ),
                      TextView(
                        text:
                            '${getCurrency()}${oCcy.format(data?.revenues?.totalRevenue ?? 0)}',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.2.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.w),
              child: TextView(
                text:
                    'Profit as at date: ${getCurrency()}${oCcy.format(data?.revenues?.totalRevenue ?? 0)}',
                fontWeight: FontWeight.w600,
                fontSize: 16.2.sp,
                color: AppColor.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 4.w),
              child: TextView(
                text:
                    'Expenditure: ${getCurrency()}${oCcy.format(data?.expenditures?.totalExpense ?? 0)}',
                fontWeight: FontWeight.w600,
                fontSize: 16.2.sp,
                color: AppColor.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
