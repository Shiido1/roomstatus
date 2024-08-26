// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/model/get_all_sales_response_model/sale.dart';
import 'package:roomstatus/core/connect_end/view_model/sales_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/image.dart';
import '../../../../widgets/text_form_widget.dart';
import '../../../../widgets/text_widget.dart';
import 'single_sale_details_screen.dart';

class AllSalesHistoryScreen extends StatefulWidget {
  const AllSalesHistoryScreen({super.key});

  @override
  State<AllSalesHistoryScreen> createState() => _AllSalesHistoryScreenState();
}

class _AllSalesHistoryScreenState extends State<AllSalesHistoryScreen> {
  RefreshController? refreshControllerState = RefreshController();

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 88, 78),
      body: ViewModelBuilder<SalesViewModel>.reactive(
          viewModelBuilder: () => locator<SalesViewModel>(),
          disposeViewModel: false,
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getAllSales(context);
            });
          },
          builder: (_, SalesViewModel model, __) {
            return SmartRefresher(
              key: const PageStorageKey('storage_key_sales'),
              enablePullUp: true,
              enablePullDown: false,
              onRefresh: () async {
                await model.onRefreshAllSales();
                // ignore: use_build_context_synchronously
                model.getAllSales(context);
                refreshControllerState?.refreshCompleted();
              },
              onLoading: () async {
                await model.onLoadingAllSales();
                refreshControllerState?.loadComplete();
              },
              controller: refreshControllerState!,
              footer: CustomFooter(builder: ((context, mode) {
                Widget body;
                if (model.getAllSalesResponseModel != null &&
                    model.getAllSalesResponseModel!.data!.sales!.isEmpty) {
                  body = TextView(
                      text: "You're caught up", color: AppColor.textColor);
                } else if (mode == LoadStatus.idle &&
                    model.isLoadNoMoreSales == false) {
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
                      text: 'Sales Histories',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.2.sp,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    TextFormWidget(
                        label: 'Search Sale',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.white),
                        fillColor: const Color.fromARGB(255, 232, 172, 167)
                            .withOpacity(.4),
                        isFilled: true,
                        prefixWidget: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: SvgPicture.asset(
                            AppImage.search,
                            color: AppColor.white,
                          ),
                        ),
                        onChange: (o) {
                          query = o;
                          setState(() {});
                        }),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (model.isLoading! ||
                        model.getAllSalesResponseModel == null)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                        ),
                      )
                    else if (model
                        .getAllSalesResponseModel!.data!.sales!.isEmpty)
                      Center(
                        child: TextView(
                          text: 'No History',
                          fontSize: 20.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    else if (model.getAllSalesResponseModel != null &&
                        model.getAllSalesResponseModel!.data!.sales!.isNotEmpty)
                      query != ''
                          ? Column(
                              children: [
                                ...model.getAllSalesResponseModel!.data!.sales!
                                    .reversed
                                    .where((element) => element.customer!
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .map((e) => reversedContent(
                                          e,
                                        ))
                              ],
                            )
                          : Column(
                              children: [
                                ...model.getAllSalesResponseModel!.data!.sales!
                                    .reversed
                                    .map((e) => reversedContent(
                                          e,
                                        ))
                              ],
                            ),
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

  reversedContent(Sale sales) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => SingleSaleDetailsScreen(
                  code: sales.code,
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
                    text: sales.customer ?? '',
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
                  text: sales.code ?? '',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 11.2.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 12.w,
                ),
                // Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           padding: EdgeInsets.only(
                //               left: 8.w, right: 8.w, top: 3.4.w, bottom: 3.4.w),
                //           decoration: BoxDecoration(
                //               color: AppColor.primary,
                //               borderRadius: BorderRadius.circular(22)),
                //           child: TextView(
                //             text: 'Unit Price',
                //             maxLines: 1,
                //             textOverflow: TextOverflow.clip,
                //             fontSize: 10.2.sp,
                //             color: AppColor.white,
                //             fontWeight: FontWeight.w800,
                //           ),
                //         ),
                //         SizedBox(
                //           height: 4.h,
                //         ),
                //         TextView(
                //           text:
                //               '${getCurrency()}${oCcy.format(sales.total ?? 0)}',
                //           fontSize: 13.2.sp,
                //           color: AppColor.black,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ],
                //     ),
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
                        text: 'Total Price',
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
                      text: '${getCurrency()}${oCcy.format(sales.total ?? 0)}',
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
            //   ],
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8.0),
                //   child: Image.network(
                //     sales.image ?? '',
                //     fit: BoxFit.cover,
                //     height: 52.h,
                //     width: 70.w,
                //   ),
                // ),
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
