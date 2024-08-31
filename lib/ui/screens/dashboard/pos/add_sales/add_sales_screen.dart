// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'package:roomstatus/core/connect_end/model/get_all_items_response_model/datum.dart';
import 'package:roomstatus/core/connect_end/view_model/sales_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/add_sales_entity_model/add_sales_entity_model.dart';
import '../../../../../core/connect_end/view_model/booking_view_model.dart';
import '../../../../../core/constants.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/app_validation.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/text_form_widget.dart';
import '../../../../widgets/text_widget.dart';

// ignore: must_be_immutable
class AddSalesScreen extends StatefulWidget {
  AddSalesScreen({super.key, required this.data});
  Datum? data;

  @override
  State<AddSalesScreen> createState() => _AddSalesScreenState();
}

class _AddSalesScreenState extends State<AddSalesScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController customerType = TextEditingController();
  TextEditingController selectRoom = TextEditingController();
  TextEditingController paymode = TextEditingController();
  TextEditingController discount = TextEditingController();

  bool onTap = false;
  bool onTapCustomer = false;
  bool onTapRoom = false;
  bool onTapItem = false;
  List<String> customerKind = ["guest", "in-room guest"];
  String s = "in-room guest";
  String? bookingId = 'null';
  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SalesViewModel>.reactive(
        viewModelBuilder: () => SalesViewModel(),
        onViewModelReady: (mode) {
          mode.getItems(context);
          mode.addedItemList.add(Datum(
              id: widget.data!.id,
              name: widget.data!.name,
              price: widget.data!.price,
              category: widget.data!.category,
              image: widget.data!.image,
              quantity: 1));
        },
        disposeViewModel: false,
        builder: (_, SalesViewModel mode, __) {
          return Scaffold(
            backgroundColor:
                const Color.fromARGB(255, 250, 150, 150).withOpacity(.9),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.w),
              child: SizedBox(
                child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                size: 26.8.sp,
                                color: AppColor.white,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextView(
                            text: 'Add Sales',
                            fontSize: 24.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                          SizedBox(
                            height: 26.2.h,
                          ),
                          ...List.generate(mode.addedItemList.length, (index) {
                            final element = mode.addedItemList[index];
                            return itemContainerWidget(
                              key: UniqueKey(),
                              onDissmiss: (direction) {
                                if (direction == DismissDirection.startToEnd) {
                                  mode.addedItemList.removeAt(index);
                                } else {
                                  mode.addedItemList.removeAt(index);
                                }
                              },
                              index: index,
                              image: element.image,
                              name: element.name,
                              price: element.price,
                              quantity: element.quantity,
                              increment: () {
                                element.quantity = element.quantity! + 1;

                                mode.addedItemList.insert(
                                    index,
                                    Datum(
                                      id: element.id,
                                      name: element.name,
                                      price: element.price,
                                      category: element.category,
                                      image: element.image,
                                      quantity: element.quantity,
                                    ));
                                mode.addedItemList.removeAt(index + 1);
                                setState(() {});
                              },
                              decrement: () {
                                if (element.quantity == 1) return;
                                element.quantity = element.quantity! - 1;

                                mode.addedItemList.insert(
                                    index,
                                    Datum(
                                      id: element.id,
                                      name: element.name,
                                      price: element.price,
                                      category: element.category,
                                      image: element.image,
                                      quantity: element.quantity,
                                    ));
                                mode.addedItemList.removeAt(index + 1);
                                setState(() {});
                              },
                            );
                          }),
                          SizedBox(
                            height: 22.2.h,
                          ),
                          SizedBox(
                            height: !onTapItem ? 0.h : 16.h,
                          ),
                          !onTapItem
                              ? const SizedBox.shrink()
                              : Container(
                                  width: double.infinity,
                                  height: 200.h,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.r),
                                    color: AppColor.white,
                                  ),
                                  child: SmartRefresher(
                                    key: const PageStorageKey(
                                        'storage_key_add_sales'),
                                    enablePullUp: true,
                                    enablePullDown: false,
                                    onRefresh: () async {
                                      await mode.onRefresh();
                                      mode.getItems(context);
                                      refreshController.refreshCompleted();
                                    },
                                    onLoading: () async {
                                      await mode.onLoading();
                                      refreshController.loadComplete();
                                    },
                                    controller: refreshController,
                                    footer:
                                        CustomFooter(builder: ((context, m) {
                                      Widget body;
                                      if (mode.getAllItemsResponseModel !=
                                              null &&
                                          mode.getAllItemsResponseModel!.data!
                                              .isEmpty||
                                  mode.getAllItemsResponseModel!.data!
                                      .isEmpty) {
                                        body = TextView(
                                            text: "You're caught up",
                                            color: AppColor.textColor);
                                      } else if (m == LoadStatus.idle &&
                                          mode.isLoadNoMore == false) {
                                        body = TextView(
                                          text: "Pull up load",
                                          color: AppColor.textColor,
                                        );
                                      } else if (m == LoadStatus.loading) {
                                        body =
                                            const CupertinoActivityIndicator();
                                      } else if (m == LoadStatus.failed) {
                                        body = TextView(
                                            text: "Load Failed!Click retry!",
                                            color: AppColor.textColor);
                                      } else if (m ==
                                          LoadStatus.canLoading) {
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
                                    child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...mode
                                                .getAllItemsResponseModelList!
                                                .map((o) => Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.w),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          mode.addedItemList
                                                              .add(Datum(
                                                                  id: o.id,
                                                                  name: o.name,
                                                                  price:
                                                                      o.price,
                                                                  category: o
                                                                      .category,
                                                                  image:
                                                                      o.image,
                                                                  quantity: 1));

                                                          onTapItem = false;
                                                          setState(() {});
                                                        },
                                                        child: TextView(
                                                          text: o.name!,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                          ]),
                                    ),
                                  )),
                          Column(
                            children: [
                              TextFormWidget(
                                hint: 'Customer Type',
                                label: '',
                                hintColor: AppColor.white,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey),
                                fillColor: AppColor.white,
                                isFilled: true,
                                readOnly: true,
                                suffixWidget: IconButton(
                                    onPressed: () {
                                      onTapCustomer = !onTapCustomer;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 26.sp,
                                    )),
                                controller: customerType,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height: !onTapCustomer ? 0.h : 16.h,
                              ),
                              !onTapCustomer
                                  ? const SizedBox.shrink()
                                  : Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.w, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        color: AppColor.white,
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...customerKind.map((o) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.w),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      customerType.text = o;
                                                      onTapCustomer = false;
                                                      setState(() {});
                                                    },
                                                    child: TextView(
                                                      text: o.capitalize!,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ))
                                          ])),
                              ViewModelBuilder<BookingViewModel>.reactive(
                                  viewModelBuilder: () => BookingViewModel(),
                                  onViewModelReady: (model) {
                                    model.getOccupiedBookings(context);
                                  },
                                  disposeViewModel: false,
                                  builder: (_, BookingViewModel model, __) {
                                    return customerType.text == s
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormWidget(
                                                hint: 'Select Room',
                                                label: '',
                                                hintColor: AppColor.white,
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.2.sp,
                                                    color: AppColor.inGrey),
                                                fillColor: AppColor.white,
                                                isFilled: true,
                                                readOnly: true,
                                                suffixWidget: IconButton(
                                                    onPressed: () {
                                                      onTapRoom = !onTapRoom;
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                      size: 26.sp,
                                                    )),
                                                controller: selectRoom,
                                                validator: AppValidator
                                                    .validateString(),
                                              ),
                                              SizedBox(
                                                height: !onTapRoom ? 0.h : 16.h,
                                              ),
                                              !onTapRoom
                                                  ? const SizedBox.shrink()
                                                  : Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16.w,
                                                              horizontal: 10.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.r),
                                                        color: AppColor.white,
                                                      ),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ...model
                                                                .getOccupiedBookingsResponseModel!
                                                                .occupiedBookings!
                                                                .map(
                                                                    (o) =>
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 10.w),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              selectRoom.text = o.details ?? '';
                                                                              bookingId = o.id.toString();
                                                                              onTapRoom = false;
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                TextView(
                                                                              text: o.details ?? '',
                                                                              fontSize: 18.sp,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ))
                                                          ])),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink();
                                  }),
                              SizedBox(
                                height: 20.h,
                              ),
                              ViewModelBuilder<BookingViewModel>.reactive(
                                  viewModelBuilder: () => BookingViewModel(),
                                  onViewModelReady: (m) {
                                    m.paymentModel(context);
                                  },
                                  disposeViewModel: false,
                                  builder: (_, BookingViewModel m, __) {
                                    return Column(
                                      children: [
                                        TextFormWidget(
                                          hint: 'Mode of Payment',
                                          label: '',
                                          hintColor: AppColor.white,
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15.2.sp,
                                              color: AppColor.inGrey),
                                          fillColor: AppColor.white,
                                          isFilled: true,
                                          readOnly: true,
                                          suffixWidget: IconButton(
                                              onPressed: () {
                                                onTap = !onTap;
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                size: 26.sp,
                                              )),
                                          controller: paymode,
                                          validator:
                                              AppValidator.validateString(),
                                        ),
                                        SizedBox(
                                          height: !onTap ? 0.h : 16.h,
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
                                                      BorderRadius.circular(
                                                          14.r),
                                                  color: AppColor.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ...m.paymentModeResponseModel!
                                                        .data!
                                                        .map((o) => Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          10.w),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  paymode.text =
                                                                      o;
                                                                  onTap = false;
                                                                  mode.notifyListeners();
                                                                },
                                                                child: TextView(
                                                                  text: o,
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
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                hint: 'Discount (%)',
                                label: '',
                                hintColor: AppColor.white,
                                keyboardType: TextInputType.number,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.2.sp,
                                    color: AppColor.inGrey),
                                fillColor: AppColor.white,
                                isFilled: true,
                                controller: discount,
                              ),
                              SizedBox(
                                height: 60.h,
                              ),
                              ButtonWidget(
                                  buttonText: 'Proceed',
                                  color: AppColor.white,
                                  border: 24,
                                  isLoading: mode.isLoading,
                                  buttonWidth: double.infinity,
                                  buttonColor: AppColor.deepprimary,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () async {
                                    await mode.getProcess();

                                    if (formKey.currentState!.validate()) {
                                      await mode.addSales(
                                          context,
                                          AddSalesEntityModel(
                                            items: mode.items,
                                            type: customerType.text.trim(),
                                            modeOfPayment: paymode.text.trim(),
                                            bookingId: bookingId == 'null'
                                                ? null
                                                : int.parse(bookingId!),
                                            discount: discount.text.isEmpty
                                                ? 0
                                                : int.parse(
                                                    discount.text.trim()),
                                          ));
                                    }
                                  }),
                              SizedBox(
                                height: 16.0.h,
                              ),
                            ],
                          ),
                        ])),
              ),
            ),
          );
        });
  }

  itemContainerWidget({
    String? image,
    String? name,
    int? price,
    int? index,
    int? quantity,
    Key? key,
    Function(DismissDirection)? onDissmiss,
    Function()? increment,
    Function()? decrement,
  }) =>
      Dismissible(
        background: Container(color: AppColor.red),
        onDismissed: onDissmiss,
        key: key!,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.deepprimary.withOpacity(.9),
              borderRadius: BorderRadius.circular(13.6.r),
              border: Border.all(color: AppColor.white)),
          padding: EdgeInsets.all(13.6.w),
          margin: EdgeInsets.only(bottom: 10.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.white, width: 2)),
                    child: CircleAvatar(
                      radius: 34.0.r,
                      backgroundImage: NetworkImage(image ?? ''),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: TextView(
                          maxLines: 2,
                          text: name ?? '',
                          textAlign: TextAlign.start,
                          textOverflow: TextOverflow.fade,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.2.sp,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        maxLines: 1,
                        text: '${getCurrency()}${oCcy.format(price)}',
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.fade,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: AppColor.primaryGrey1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.8.w,
                  ),
                  if (index == 0)
                    GestureDetector(
                      onTap: () => setState(() {
                        onTapItem = !onTapItem;
                      }),
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                            color: AppColor.green9ja1, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 12.8.w,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: increment,
                    child: Container(
                      padding: EdgeInsets.all(4.4.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: .7),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.2.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.white, width: .7),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextView(
                      text: '$quantity',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.2.w,
                  ),
                  GestureDetector(
                    onTap: decrement,
                    child: Container(
                      padding: EdgeInsets.all(4.4.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: .7),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.remove,
                        size: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
