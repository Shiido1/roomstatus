// ignore_for_file: must_be_immutable
import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../core/connect_end/view_model/report_view_model.dart';
import '../../../../../../core/core_folder/app/app.locator.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../widgets/text_widget.dart';

class GuestListDisplayScreen extends StatelessWidget {
  GuestListDisplayScreen({
    super.key,
    required this.entity,
  });
  GuestListEntityModel? entity;

  RefreshController? refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 153, 147),
      body: ViewModelBuilder<ReportViewModel>.reactive(
          viewModelBuilder: () => locator<ReportViewModel>(),
          disposeViewModel: false,
          onViewModelReady: (model) {},
          builder: (_, ReportViewModel model, __) {
            return SmartRefresher(
              key: const PageStorageKey('storage_key'),
              enablePullUp: true,
              enablePullDown: false,
              onRefresh: () async {
                await model.onRefreshGuest();
                model.guestlist(context, entity!);
                refreshController?.refreshCompleted();
              },
              onLoading: () async {
                await model.onLoadingGuest(entity!);
                refreshController?.loadComplete();
              },
              controller: refreshController!,
              footer: CustomFooter(builder: ((context, mode) {
                Widget body;
                if (model.guestListResponseModel != null &&
                    model.guestListResponseModel!.data!.isEmpty) {
                  body = TextView(
                      text: "You're caught up", color: AppColor.textColor);
                } else if (mode == LoadStatus.idle &&
                    model.isLoadNoMoreGuest == false) {
                  body = TextView(
                    text: "Pull up load",
                    color: AppColor.textColor,
                  );
                } else if (mode == LoadStatus.loading) {
                  body = const CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = TextView(
                      text: "Load Failed!Click retry!",
                      color: AppColor.textColor);
                } else if (mode == LoadStatus.canLoading) {
                  body = TextView(
                      text: "release to load more", color: AppColor.textColor);
                } else {
                  body = TextView(
                      text: "You're caught up", color: AppColor.textColor);
                }
                return SizedBox(
                  height: 50.0,
                  child: Center(child: body),
                );
              })),
              child: SingleChildScrollView(
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
                        text: 'Guest List',
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
                    if (model.isLoading!)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                        ),
                      )
                    else if (model.guestListResponseModelList!.isEmpty)
                      Center(
                        child: TextView(
                          text: 'No History',
                          fontSize: 20.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    else if (model.guestListResponseModel != null &&
                        model.guestListResponseModelList!.isNotEmpty)
                      ...model.guestListResponseModelList!
                          .map((e) => reversedContent(
                                idNumber: e.idNumber ?? '',
                                customerName: e.customer ?? '',
                                gender: e.phone ?? '',
                                room: e.room ?? '',
                                idType: e.idType,
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
    String? idNumber,
    String? idType,
    String? room,
    String? gender,
    String? checkIn,
    String? checkOut,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() {},
            transition: Transition.downToUp,
            duration: const Duration(seconds: 1));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
        padding:
            EdgeInsets.only(top: 8.w, bottom: 8.w, left: 10.6.w, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      width: 200.w,
                      child: TextView(
                        text: 'ID Type: $idType',
                        maxLines: 2,
                        textOverflow: TextOverflow.clip,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'ID Number: $idNumber',
                          maxLines: 1,
                          textOverflow: TextOverflow.clip,
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextView(
                          text: '$gender',
                          maxLines: 1,
                          textOverflow: TextOverflow.clip,
                          fontSize: 14.2.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text: '$room',
                      maxLines: 1,
                      textOverflow: TextOverflow.clip,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
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
          ],
        ),
      ),
    );
  }
}
