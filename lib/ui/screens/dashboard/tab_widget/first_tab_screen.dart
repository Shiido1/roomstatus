import 'package:roomstatus/core/connect_end/view_model/auth_view_model.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/screens/dashboard/tab_widget/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:shimmer/shimmer.dart';
import '../../../app_assets/app_color.dart';
import '../../../widgets/text_widget.dart';
import '../add_booking/add_booking_screen.dart';

// ignore: must_be_immutable
class FirstTabScreen extends ViewModelWidget<AuthViewModel> {
  const FirstTabScreen({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return SizedBox(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                viewModel.searchFormField(),
                // SizedBox(
                //   width: 20.w,
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 12.w),
                //   padding: EdgeInsets.all(11.4.w),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: AppColor.deepprimary),
                //   child: SvgPicture.asset(AppImage.dash),
                // ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Rooms',
                  fontSize: 17.2.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () => viewModel.selectDate(context),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 4.w, bottom: 4.w, left: 8.w, right: 12.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.white, width: 1.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: viewModel.formattedDate ?? '',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SvgPicture.asset(
                          AppImage.downarrow,
                          color: AppColor.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            viewModel.isLoading
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...[
                          1,
                          2,
                          3,
                          4,
                          5,
                          6,
                          7,
                          8,
                          9,
                          0,
                          1,
                          2,
                          3,
                          4,
                          5,
                          6,
                          7,
                          8,
                          9,
                          0
                        ].map((e) => Shimmer.fromColors(
                            baseColor: AppColor.white,
                            highlightColor:
                                AppColor.deepprimary.withOpacity(.3),
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: 10.w, right: 10.w),
                              height: 30.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.primary,
                              ),
                            )))
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        StatusWidget(
                          text1: 'ALL',
                          text: 'ALL',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('ALL');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'AVAILABLE:${viewModel.getStatusResponseModel?.data?.all ?? ''}',
                          text: 'AVAILABLE',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('AVAILABLE');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'REPAIR:${viewModel.getStatusResponseModel?.data?.repair ?? ''}',
                          text: 'REPAIR',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('REPAIR');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'UNPAID:${viewModel.getStatusResponseModel?.data?.unpaid ?? ''}',
                          text: 'UNPAID',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('UNPAID');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'PAID:${viewModel.getStatusResponseModel?.data?.paid ?? ''}',
                          text: 'PAID',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('PAID');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'OCCUPIED:${viewModel.getStatusResponseModel?.data?.occupied ?? ''}',
                          text: 'OCCUPIED',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('OCCUPIED');
                          },
                        ),
                        StatusWidget(
                          text1:
                              'DIRTY:${viewModel.getStatusResponseModel?.data?.dirty ?? ''}',
                          text: 'DIRTY',
                          callback: () {
                            viewModel.getStatusTapped(true);
                            viewModel.groupRoom('DIRTY');
                          },
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: 30.h,
            ),
            viewModel.isLoading || viewModel.allRoomsResponseModel == null
                ? SizedBox(
                    height: 450,
                    child: GridView.count(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15.4,
                      padding: EdgeInsets.only(left: 4.w),
                      crossAxisCount: 4,
                      children: <Widget>[
                        ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) =>
                            Shimmer.fromColors(
                                baseColor: AppColor.white,
                                highlightColor:
                                    AppColor.deepprimary.withOpacity(.3),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20.w),
                                  height: 150.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColor.primary,
                                  ),
                                )))
                      ],
                    ),
                  )
                : viewModel.query != ''
                    ? SizedBox(
                        height: 300.h,
                        child: GridView.count(
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10,
                          padding: EdgeInsets.only(left: 4.w),
                          crossAxisCount: 4,
                          children: <Widget>[
                            // ignore: unrelated_type_equality_checks
                            if (viewModel.isStatusTapped == true &&
                                viewModel.rooms!.isNotEmpty)
                              ...viewModel.rooms!
                                  .where((item) =>
                                      item.type!.contains(viewModel.query))
                                  .map(
                                    (e) => GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => AddBookingScreen(
                                                    id: e.id.toString(),
                                                  ),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 1));
                                        },
                                        child: dashContainer(
                                            backGroundColor: viewModel
                                                .statusColor(e.status!),
                                            textColor: viewModel
                                                .statusColorText(e.status!),
                                            textType: e.type ?? '',
                                            text: '${e.number}')),
                                  )
                            else
                              ...viewModel.allRoomsResponseModel!.data!.rooms!
                                  .where(
                                      (e) => e.type!.contains(viewModel.query))
                                  .map(
                                    (e) => GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => AddBookingScreen(
                                                    id: e.id.toString(),
                                                  ),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 1));
                                        },
                                        child: dashContainer(
                                            backGroundColor: viewModel
                                                .statusColor(e.status!),
                                            textColor: viewModel
                                                .statusColorText(e.status!),
                                            textType: e.type ?? '',
                                            text: '${e.number}')),
                                  )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 300,
                        child: GridView.count(
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 4.w),
                          crossAxisCount: 4,
                          children: <Widget>[
                            // ignore: unrelated_type_equality_checks
                            if (viewModel.isStatusTapped == false &&
                                viewModel.allRoomsResponseModel!.data!.rooms!
                                    .isNotEmpty)
                              ...viewModel.allRoomsResponseModel!.data!.rooms!
                                  .map((e) => GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => AddBookingScreen(
                                                  id: e.id.toString(),
                                                ),
                                            transition: Transition.fade,
                                            duration:
                                                const Duration(seconds: 1));
                                      },
                                      child: dashContainer(
                                          backGroundColor:
                                              viewModel.statusColor(e.status!),
                                          textColor: viewModel
                                              .statusColorText(e.status!),
                                          textType: e.type ?? '',
                                          text: '${e.number}')))
                            else if (viewModel.allRoomsResponseModel!.data!
                                    .rooms!.isEmpty ||
                                viewModel.isStatusTapped == true &&
                                    viewModel.rooms!.isEmpty)
                              TextView(
                                text: 'No rooms',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )
                            else if (viewModel.isStatusTapped != true ||
                                viewModel.isStatusTapped == true &&
                                    viewModel.rooms!.isNotEmpty)
                              ...viewModel.rooms!.map(
                                (e) => GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => AddBookingScreen(
                                                id: e.id.toString(),
                                              ),
                                          transition: Transition.fade,
                                          duration: const Duration(seconds: 1));
                                    },
                                    child: dashContainer(
                                        backGroundColor:
                                            viewModel.statusColor(e.status!),
                                        textColor: viewModel
                                            .statusColorText(e.status!),
                                        textType: e.type ?? '',
                                        text: '${e.number}')),
                              )
                          ],
                        ),
                      ),
            
          ],
        ),
      ),
    );
  }

  dashContainer(
          {required Color backGroundColor,
          required Color textColor,
          required String textType,
          required String text}) =>
      Container(
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120.w,
              child: TextView(
                textOverflow: TextOverflow.fade,
                text: textType,
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                maxLines: 2,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: 100.w,
              child: TextView(
                text: text,
                fontSize: 12.61,
                textAlign: TextAlign.center,
                textOverflow: TextOverflow.fade,
                maxLines: 1,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
}
