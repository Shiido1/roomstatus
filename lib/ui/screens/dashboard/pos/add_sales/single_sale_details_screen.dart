import 'package:roomstatus/core/connect_end/view_model/sales_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/image.dart';
import '../../../../widgets/print_button_widget.dart';
import '../../../../widgets/text_widget.dart';

// ignore: must_be_immutable
class SingleSaleDetailsScreen extends StatelessWidget {
  SingleSaleDetailsScreen({
    super.key,
    required this.code,
  });
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 102, 93),
      body: ViewModelBuilder<SalesViewModel>.reactive(
          viewModelBuilder: () => locator<SalesViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              model.getSingleSales(context, code!);
            });
          },
          disposeViewModel: false,
          builder: (_, SalesViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 16.w),
              child: Column(
                children: [
                  model.isLoading! || model.singleSalesResponseModel == null
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 80.w),
                            child: const CircularProgressIndicator(
                              color: AppColor.white,
                            ),
                          ),
                        )
                      : model.singleSalesResponseModel!.items!.isEmpty
                          ? Center(
                              child: Padding(
                              padding: EdgeInsets.only(top: 80.w),
                              child: TextView(text: 'No Item'),
                            ))
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Sales Detail',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21.2.sp,
                                      color: AppColor.white,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () => model
                                                  .displayEditSalesModalBottomSheet(
                                                      context: context,
                                                      code: code),
                                              child: SvgPicture.asset(
                                                  AppImage.edit)),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          GestureDetector(
                                              onTap: () =>
                                                  model.showAlertDialog(
                                                      context, code!),
                                              child: SvgPicture.asset(
                                                  AppImage.delete))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                if (model.singleSalesResponseModel != null ||
                                    model.singleSalesResponseModel!.items!
                                        .isNotEmpty)
                                  ...model.singleSalesResponseModel!.items!
                                      .map((e) {
                                    return model.body(
                                      context,
                                      image: e.image,
                                      item: e.item,
                                      price: e.itemPrice.toString(),
                                      quantity: e.quantity.toString(),
                                    );
                                  }),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: model.singleSalesResponseModel
                                                  ?.code ??
                                              '',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.2.sp,
                                          color: AppColor.white,
                                        ),
                                        TextView(
                                          text: model.singleSalesResponseModel
                                                  ?.customer ??
                                              '',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.2.sp,
                                          color: AppColor.white,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextView(
                                          text:
                                              '${getCurrency()}${oCcy.format(model.sumUsingLoop(model.singleSalesResponseModel!.items!))}',
                                          fontWeight: FontWeight.w800,
                                          color: AppColor.white,
                                          fontSize: 22.2.sp,
                                        ),
                                        model.singleSalesResponseModel
                                                    ?.modeOfPayment!
                                                    .toLowerCase() ==
                                                'POS'.toLowerCase()
                                            ? IconButton(
                                                onPressed: () {
                                                  Clipboard.setData(ClipboardData(
                                                      text:
                                                          '${model.sumUsingLoop(model.singleSalesResponseModel!.items!)}'));
                                                },
                                                icon: Icon(
                                                  Icons.copy,
                                                  size: 16.8.sp,
                                                  color: AppColor.white,
                                                ))
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                  ],
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
                                    onPressed: () =>
                                        model.printReceiptWidget()),
                                SizedBox(
                                  height: 16.0.h,
                                ),
                              ],
                            )
                ],
              ),
            );
          }),
    );
  }
}
