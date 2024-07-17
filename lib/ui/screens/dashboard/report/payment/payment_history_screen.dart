// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/report_view_model.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widgets/text_widget.dart';

class PaymentHistoryScreen extends StatelessWidget {
  PaymentHistoryScreen({super.key, required this.id});
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: ViewModelBuilder<ReportViewModel>.reactive(
          viewModelBuilder: () => locator<ReportViewModel>(),
          disposeViewModel: false,
          onViewModelReady: (model) {
            model.paymentHistory(context, id!);
          },
          builder: (_, ReportViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
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
                    text: 'Credit Payment Histories',
                    fontWeight: FontWeight.w700,
                    fontSize: 24.2.sp,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  if (model.payHistoryResponseModel != null &&
                      model.payHistoryResponseModel!.data!.payments!.isEmpty)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50.w),
                        child: TextView(
                          text: 'No History',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.2.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  if (model.payHistoryResponseModel != null ||
                      model.payHistoryResponseModel!.data != null ||
                      model.payHistoryResponseModel!.data!.payments!.isNotEmpty)
                    ...model.payHistoryResponseModel!.data!.payments!.map((e) =>
                        paymentWidget(
                            name: e.transactionDate ?? '',
                            owe: e.due ?? 0,
                            balance: e.net ?? 0,
                            paid: e.amountPaid ?? 0))
                ],
              ),
            );
          }),
    );
  }

  paymentWidget({String? name, dynamic owe, dynamic paid, dynamic balance}) =>
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 18.4.w,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: "Transaction Date",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 16.2.h,
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: owe == null
                          ? '${getCurrency()}${oCcy.format(0)}'
                          : '${getCurrency()}${oCcy.format(owe!)}',
                      fontSize: 14.2.sp,
                      color: AppColor.deeperprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
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
                        text: 'Amount Paid',
                        fontSize: 11.2.sp,
                        color: AppColor.deeperprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '${getCurrency()}${oCcy.format(paid)}',
                      fontSize: 14.2.sp,
                      color: AppColor.deeperprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
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
                        text: 'Balance',
                        fontSize: 11.2.sp,
                        color: AppColor.deeperprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '${getCurrency()}${oCcy.format(balance)}',
                      fontSize: 14.2.sp,
                      color: AppColor.deeperprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}
