// ignore_for_file: must_be_immutable

import 'package:roomstatus/core/connect_end/view_model/report_view_model.dart';
import 'package:roomstatus/ui/screens/dashboard/report/report_revenue_screen.form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../core/connect_end/model/report_room_entity_model.dart';
import '../../../../core/connect_end/model/report_sales_entity_model.dart';
import '../../../../core/constants.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';
import '../../../widgets/text_widget.dart';
import '../tab_widget/widgets/linear_status_widget.dart';

@FormView(fields: [
  FormTextField(name: 'room'),
  FormTextField(name: 'start'),
  FormTextField(name: 'end'),
])
class ReportRevenue extends StatefulWidget with $ReportRevenue {
  ReportRevenue({super.key});

  @override
  State<ReportRevenue> createState() => _ReportRevenueState();
}

class _ReportRevenueState extends State<ReportRevenue> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedCheckinDate = DateTime.now();

  DateTime selectedCheckoutDate = DateTime.now();

  bool onTap = false;
  bool onTapSales = false;
  String? id;
  RefreshController? refreshController = RefreshController();

  String? _formattedCheckInDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  String? _formattedCheckOutDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectCheckInDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckinDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      _formattedCheckInDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckinDate);

      widget.startController.text = _formattedCheckInDate!;
    }
  }

  Future<void> selectCheckOutDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckoutDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
      _formattedCheckOutDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckoutDate);

      widget.endController.text = _formattedCheckOutDate!;
    }
  }

  String now = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 153, 147),
        body: ViewModelBuilder<ReportViewModel>.reactive(
            viewModelBuilder: () => locator<ReportViewModel>(),
            disposeViewModel: false,
            onViewModelReady: (model) {
              widget.roomController.text = 'all';
              model.getAllRooms(context, date: now);
              model.getItems(context);
              model.corporateAccount(context);
            },
            builder: (_, ReportViewModel model, __) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 42.h,
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 26.sp,
                              color: AppColor.white,
                            )),
                        SizedBox(
                          height: 22.h,
                        ),
                        TextView(
                          text: 'Revenues',
                          fontWeight: FontWeight.w700,
                          fontSize: 24.2.sp,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Row(
                            children: [
                              ...model.revenue.map((e) => LinearStatusWidget(
                                    text: e,
                                    callback: () {
                                      model.revenue1.clear();
                                      model.revenue1.add(e);
                                      model.notifyListeners();
                                    },
                                    color: model.revenue1.contains(e)
                                        ? AppColor.black
                                        : AppColor.white,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        // model.revenue1.contains('Revenue from Hall')
                        //     ? Column(
                        //         children: [
                        //           TextFormWidget(
                        //             hint: 'Hall',
                        //             label: '',
                        //             hintColor: AppColor.white,
                        //             labelStyle: TextStyle(
                        //                 fontWeight: FontWeight.w400,
                        //                 fontSize: 15.2.sp,
                        //                 color: AppColor.inGrey),
                        //             fillColor: AppColor.white,
                        //             isFilled: true,
                        //             controller: widget.roomController,
                        //             validator: AppValidator.validateString(),
                        //           ),
                        //           SizedBox(
                        //             height: 20.h,
                        //           ),
                        //           TextFormWidget(
                        //               hint: 'Start',
                        //               hintColor: AppColor.white,
                        //               label: 'DD/MM/YYYY',
                        //               labelStyle: TextStyle(
                        //                   fontWeight: FontWeight.w400,
                        //                   fontSize: 15.2.sp,
                        //                   color: AppColor.inGrey),
                        //               fillColor: AppColor.white,
                        //               isFilled: true,
                        //               readOnly: true,
                        //               suffixWidget: IconButton(
                        //                   onPressed: () =>
                        //                       selectCheckInDate(context),
                        //                   icon: Icon(
                        //                     Icons.edit_calendar_rounded,
                        //                     size: 20.sp,
                        //                     color: AppColor.deeperprimary,
                        //                   )),
                        //               controller: widget.startController,
                        //               validator: AppValidator.validateString()),
                        //           SizedBox(
                        //             height: 20.h,
                        //           ),
                        //           TextFormWidget(
                        //             hint: 'End',
                        //             label: 'DD/MM/YYYY',
                        //             hintColor: AppColor.white,
                        //             labelStyle: TextStyle(
                        //                 fontWeight: FontWeight.w400,
                        //                 fontSize: 15.2.sp,
                        //                 color: AppColor.inGrey),
                        //             fillColor: AppColor.white,
                        //             isFilled: true,
                        //             readOnly: true,
                        //             suffixWidget: IconButton(
                        //                 onPressed: () =>
                        //                     selectCheckOutDate(context),
                        //                 icon: Icon(
                        //                   Icons.edit_calendar_rounded,
                        //                   size: 20.sp,
                        //                   color: AppColor.deeperprimary,
                        //                 )),
                        //             controller: widget.endController,
                        //             validator: AppValidator.validateString(),
                        //           ),
                        //           SizedBox(
                        //             height: 100.h,
                        //           ),
                        //           ButtonWidget(
                        //               buttonText: 'Proceed',
                        //               color: AppColor.white,
                        //               border: 24,
                        //               isLoading: model.isLoading,
                        //               buttonWidth: double.infinity,
                        //               buttonColor: AppColor.deepprimary,
                        //               buttonBorderColor: Colors.transparent,
                        //               onPressed: () {
                        //                 if (formKey.currentState!.validate()) {}
                        //               }),
                        //           SizedBox(
                        //             height: 16.0.h,
                        //           ),
                        //         ],
                        //       )
                        // :
                        model.revenue1.contains('Revenue from Sales')
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextFormWidget(
                                        hint: 'Sales',
                                        label: '',
                                        hintColor: AppColor.white,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.2.sp,
                                            color: AppColor.inGrey),
                                        fillColor: AppColor.white,
                                        isFilled: true,
                                        controller: widget.roomController,
                                        validator:
                                            AppValidator.validateString(),
                                        suffixWidget: IconButton(
                                            onPressed: () {
                                              onTapSales = !onTapSales;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 26.sp,
                                            ))),
                                    SizedBox(
                                      height: !onTapSales ? 0.h : 20.h,
                                    ),
                                    !onTapSales
                                        ? const SizedBox.shrink()
                                        : Container(
                                            height: 230.h,
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.w,
                                                horizontal: 10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                              color: AppColor.white,
                                            ),
                                            child: SmartRefresher(
                                              key: const PageStorageKey(
                                                  'storage_key'),
                                              enablePullUp: true,
                                              enablePullDown: false,
                                              onRefresh: () async {
                                                await model.onRefresh();
                                                model.getItems(context);
                                                refreshController
                                                    ?.refreshCompleted();
                                              },
                                              onLoading: () async {
                                                await model.onLoading();
                                                refreshController
                                                    ?.loadComplete();
                                              },
                                              controller: refreshController!,
                                              footer: CustomFooter(
                                                  builder: ((context, mode) {
                                                Widget body;
                                                if (model.getAllItemsResponseModel !=
                                                        null &&
                                                    model
                                                        .getAllItemsResponseModel!
                                                        .data!
                                                        .isEmpty) {
                                                  body = TextView(
                                                      text: "You're caught up",
                                                      color:
                                                          AppColor.textColor);
                                                } else if (mode ==
                                                        LoadStatus.idle &&
                                                    model.isLoadNoMore ==
                                                        false) {
                                                  body = TextView(
                                                    text: "Pull up load",
                                                    color: AppColor.textColor,
                                                  );
                                                } else if (mode ==
                                                    LoadStatus.loading) {
                                                  body =
                                                      const CupertinoActivityIndicator();
                                                } else if (mode ==
                                                    LoadStatus.failed) {
                                                  body = TextView(
                                                      text:
                                                          "Load Failed!Click retry!",
                                                      color:
                                                          AppColor.textColor);
                                                } else if (mode ==
                                                    LoadStatus.canLoading) {
                                                  body = TextView(
                                                      text:
                                                          "release to load more",
                                                      color:
                                                          AppColor.textColor);
                                                } else {
                                                  body = TextView(
                                                      text: "You're caught up",
                                                      color:
                                                          AppColor.textColor);
                                                }
                                                return SizedBox(
                                                  height: 50.0,
                                                  child: Center(child: body),
                                                );
                                              })),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        id = 'all';
                                                        widget.roomController
                                                            .text = 'All';
                                                        onTapSales = false;

                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 6.w),
                                                        child: TextView(
                                                          text: 'All',
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    if (model
                                                        .getAllItemsResponseModelList!
                                                        .isEmpty)
                                                      const SizedBox.shrink()
                                                    else
                                                      ...model
                                                          .getAllItemsResponseModelList!
                                                          .map((o) => Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10.w),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    widget.roomController
                                                                            .text =
                                                                        o.name!;
                                                                    id = o.id
                                                                        .toString();
                                                                    onTapSales =
                                                                        false;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        o.name ??
                                                                            '',
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
                                            ),
                                          ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextFormWidget(
                                        hint: 'Start',
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
                                        controller: widget.startController,
                                        validator:
                                            AppValidator.validateString()),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextFormWidget(
                                      hint: 'End',
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
                                      controller: widget.endController,
                                      validator: AppValidator.validateString(),
                                    ),
                                    SizedBox(
                                      height: 100.h,
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
                                          if (formKey.currentState!
                                              .validate()) {
                                            model.reportSales(
                                                context,
                                                ReportSalesEntityModel(
                                                    itemId: id.toString(),
                                                    start: widget
                                                        .startController.text
                                                        .trim(),
                                                    end: widget
                                                        .endController.text
                                                        .trim()));
                                          }
                                        }),
                                    SizedBox(
                                      height: 16.0.h,
                                    ),
                                  ],
                                ),
                              )
                            : model.revenue1
                                    .contains('Corporate / Collection Accounts')
                                ? Column(
                                    children: [
                                      if (model.getCorporateModel != null &&
                                          model.getCorporateModel!.data!
                                              .isNotEmpty)
                                        ...model.getCorporateModel!.data!.map(
                                            (e) => corporateWidget(
                                                name: e.name ?? '',
                                                own: '${e.amountOweing ?? 0}',
                                                credit: '${e.creditLimit ?? 0}',
                                                onTap: () => model
                                                    .displayBookingModalBottomSheet(
                                                        context: context,
                                                        id: e.id.toString(),
                                                        amount: e.amountOweing
                                                            .toString(),
                                                        name: e.name)))
                                    ],
                                  )
                                : Column(children: [
                                    TextFormWidget(
                                        hint: 'Room',
                                        label: '',
                                        hintColor: AppColor.white,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.2.sp,
                                            color: AppColor.inGrey),
                                        fillColor: AppColor.white,
                                        isFilled: true,
                                        controller: widget.roomController,
                                        validator:
                                            AppValidator.validateString(),
                                        suffixWidget: IconButton(
                                            onPressed: () {
                                              onTap = !onTap;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 26.sp,
                                            ))),
                                    SizedBox(
                                      height: onTap ? 20.h : 0.h,
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
                                                  BorderRadius.circular(14.r),
                                              color: AppColor.white,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      id = 'all';
                                                      widget.roomController
                                                          .text = 'all';
                                                      onTap = false;
                                                      setState(() {});
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 6.w),
                                                      child: TextView(
                                                        text: 'All',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  ...model
                                                      .allRoomsResponseModel!
                                                      .data!
                                                      .rooms!
                                                      .map((o) => Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.w),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                widget.roomController
                                                                        .text =
                                                                    o.type!;
                                                                id = o.id
                                                                    .toString();
                                                                onTap = false;
                                                                setState(() {});
                                                              },
                                                              child: TextView(
                                                                text: o.type ??
                                                                    '',
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ))
                                                ],
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextFormWidget(
                                        hint: 'Start',
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
                                        controller: widget.startController,
                                        validator:
                                            AppValidator.validateString()),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextFormWidget(
                                      hint: 'End',
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
                                      controller: widget.endController,
                                      validator: AppValidator.validateString(),
                                    ),
                                    SizedBox(
                                      height: 100.h,
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
                                          if (formKey.currentState!
                                              .validate()) {
                                            model.reportRoom(
                                                context,
                                                ReportRoomEntityModel(
                                                    room: id,
                                                    start: widget
                                                        .startController.text
                                                        .trim(),
                                                    end: widget
                                                        .endController.text
                                                        .trim()));
                                          }
                                        }),
                                    SizedBox(
                                      height: 16.0.h,
                                    ),
                                  ]),
                      ],
                    )),
              );
            }));
  }

  corporateWidget(
          {String? name, dynamic own, dynamic credit, Function()? onTap}) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250.w,
              child: TextView(
                text: name!,
                fontSize: 16.sp,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 158, 152),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextView(
                        text: 'Amount Owing',
                        fontSize: 11.2.sp,
                        color: AppColor.deeperprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '${getCurrency()}${oCcy.format(int.parse(own!))}',
                      fontSize: 14.2.sp,
                      color: AppColor.deeperprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 158, 152),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextView(
                        text: 'Credit Limit',
                        fontSize: 11.2.sp,
                        color: AppColor.deeperprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '${getCurrency()}${oCcy.format(int.parse(credit))}',
                      fontSize: 14.2.sp,
                      color: AppColor.deeperprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.primary)),
                    child: Icon(
                      Icons.more_horiz,
                      size: 26.sp,
                      color: AppColor.primary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
