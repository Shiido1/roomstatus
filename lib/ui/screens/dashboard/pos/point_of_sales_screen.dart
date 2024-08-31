// ignore_for_file: deprecated_member_use

import 'package:roomstatus/core/connect_end/model/get_all_items_response_model/datum.dart';
import 'package:roomstatus/core/connect_end/view_model/sales_view_model.dart';
import 'package:roomstatus/ui/screens/dashboard/pos/add_sales/add_sales_screen.dart';
import 'package:roomstatus/ui/screens/dashboard/pos/add_sales/all_sales_history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/image.dart';
import '../../../widgets/text_form_widget.dart';
import '../../../widgets/text_widget.dart';
import '../tab_widget/widgets/linear_status_widget.dart';

class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  RefreshController? refreshController = RefreshController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: ViewModelBuilder<SalesViewModel>.reactive(
          viewModelBuilder: () => locator<SalesViewModel>(),
          disposeViewModel: false,
          initialiseSpecialViewModelsOnce: true,
          fireOnViewModelReadyOnce: true,
          onViewModelReady: (model) {
            model.getItems(context);
            model.getCategoryItems(context);
          },
          builder: (_, SalesViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 42.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Point Of Sales',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.2.sp,
                        color: AppColor.white,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const AllSalesHistoryScreen(),
                                transition: Transition.downToUp,
                                duration: const Duration(seconds: 1));
                          },
                          child: SvgPicture.asset(
                            AppImage.noteText,
                            color: AppColor.white,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  TextFormWidget(
                      label: 'Search Item',
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
                  model.isLoading! || model.getCategoryItemResponseList == null
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
                              ].map((e) => Shimmer.fromColors(
                                  baseColor: AppColor.white,
                                  highlightColor:
                                      AppColor.deepprimary.withOpacity(.3),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: 10.w, right: 10.w),
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
                              if (model.getCategoryItemResponseList != null &&
                                  model.getCategoryItemResponseList!
                                      .categoryItem!.isNotEmpty)
                                LinearStatusWidget(
                                  text: 'All',
                                  callback: () {
                                    model.isItemTapped = false;
                                    model.groupItems(context, 'all');
                                    model.notifyListeners();
                                  },
                                  color: model.isItemTapped == false
                                      ? AppColor.black
                                      : AppColor.white,
                                ),
                              ...model
                                  .getCategoryItemResponseList!.categoryItem!
                                  .map((e) => LinearStatusWidget(
                                        text: e.source ?? '',
                                        callback: () {
                                          model.isItemTapped = true;
                                          model.groupItems(context, e.source);
                                          model.notifyListeners();
                                        },
                                        color:
                                            model.itemList.contains(e.source) &&
                                                    model.isItemTapped
                                                ? AppColor.black
                                                : AppColor.white,
                                      )),
                            ],
                          ),
                        ),
                  model.isLoading! || model.getAllItemsResponseModel == null
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height*.6,
                          child: GridView.count(
                            padding: EdgeInsets.only(top: 16.0.w),
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            shrinkWrap: true,
                            children: <Widget>[
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
                                9,
                                8,
                                6,
                                5,
                                4,
                              ].map((e) => Shimmer.fromColors(
                                  baseColor: AppColor.white,
                                  highlightColor:
                                      AppColor.deepprimary.withOpacity(.3),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20.w),
                                    height: 300.h,
                                    width: 300.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primary,
                                    ),
                                  )))
                            ],
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height*.5,
                          child: SmartRefresher(
                            key: const PageStorageKey('storage_key_items'),
                            enablePullUp: true,
                            enablePullDown: false,
                            onRefresh: () async {
                              await model.onRefresh();
                              // ignore: use_build_context_synchronously
                              model.getItems(context);
                              refreshController?.refreshCompleted();
                            },
                            onLoading: () async {
                              await model.onLoading();
                              refreshController?.loadComplete();
                            },
                            controller: refreshController!,
                            footer: CustomFooter(builder: ((context, mode) {
                              Widget body;
                              if (model.getAllItemsResponseModel != null &&
                                      model.getAllItemsResponseModelList!
                                          .isEmpty ||
                                  model.getAllItemsResponseModel!.data!
                                      .isEmpty) {
                                body = TextView(
                                    text: "You're caught up",
                                    color: AppColor.textColor);
                              } else if (mode == LoadStatus.idle &&
                                  model.isLoadNoMore == false) {
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
                                    text: "release to load more",
                                    color: AppColor.textColor);
                              } else {
                                body = TextView(
                                    text: "You're caught up",
                                    color: AppColor.textColor);
                              }
                              return SizedBox(
                                height: 50.0,
                                child: Center(child: body),
                              );
                            })),
                            child: query != ''
                                ? GridView(
                                    padding: EdgeInsets.only(top: 16.0.w),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisExtent: 220,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing:
                                                10 // ** add this **
                                            ),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    children: [
                                      if (model.getAllItemsResponseModel != null &&
                                          model.getAllItemsList.isNotEmpty)
                                        ...model.getAllItemsList
                                            .where((value) => value.name!
                                                .toLowerCase()
                                                .contains(query.toLowerCase()))
                                            .map((e) => salesContWidget(d: e))
                                      else if (model.getAllItemsResponseModel != null &&
                                          model.getAllItemsResponseModelList!
                                              .isNotEmpty)
                                        ...model.getAllItemsResponseModelList!
                                            .where((value) => value.name!
                                                .toLowerCase()
                                                .contains(query.toLowerCase()))
                                            .map((e) => salesContWidget(d: e))
                                      else if (model.getAllItemsResponseModel!
                                              .data!.isEmpty &&
                                          model.getAllItemsList.isEmpty)
                                        TextView(text: 'No Item')
                                    ],
                                  )
                                : GridView(
                                    padding: EdgeInsets.only(
                                        top: 16.0.w,),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisExtent: 240,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing:
                                                10 // ** add this **
                                            ),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    children: [
                                      if (model.getAllItemsResponseModel !=
                                              null &&
                                          model.getAllItemsList.isNotEmpty)
                                        ...model.getAllItemsList
                                            .map((e) => salesContWidget(d: e))
                                      else if (model.getAllItemsResponseModel !=
                                              null &&
                                          model.getAllItemsResponseModelList!
                                              .isNotEmpty)
                                        ...model.getAllItemsResponseModelList!
                                            .map((e) => salesContWidget(d: e))
                                      else if (model
                                              .getAllItemsResponseModelList!
                                              .isEmpty &&
                                          model.getAllItemsList.isEmpty)
                                        TextView(text: 'No Item')
                                    ],
                                  ),
                          ),
                        )
                ],
              ),
            );
          }),
    );
  }

  salesContWidget({required Datum d}) => GestureDetector(
        onTap: () {
          Get.to(() => AddSalesScreen(data: d),
              transition: Transition.fade,
              duration: const Duration(seconds: 2));
        },
        child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.white, width: 2)),
              child: CircleAvatar(
                radius: 70.r,
                backgroundImage: NetworkImage(d.image ?? ''),
              ),
            ),
      );
}
