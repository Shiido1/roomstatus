import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:roomstatus/ui/app_assets/app_utils.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/screens/dashboard/report/payment/guest_list/guest_list_screen.dart';
import 'package:roomstatus/ui/screens/dashboard/report/report_revenue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../app_assets/app_color.dart';
import '../../../widgets/text_widget.dart';
import 'payment/profit_and_loss/profit_and_loss_screen.dart';

// ignore: must_be_immutable
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List<dynamic> mapList = [
    {'text': "Revenue", 'svg': AppImage.revenue, 'color': AppColor.primaryGrey},
    {
      'text': "Finance(Profit & Loss)",
      'svg': AppImage.profit,
      'color': AppColor.lightPink
    },
    {
      'text': "Generate Guest List",
      'svg': AppImage.list,
      'color': AppColor.lightPurple
    },
    {
      'text': "Generate Payroll Report",
      'svg': AppImage.payroll,
      'color': AppColor.niceCream
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42.h,
            ),
            TextView(
              text: 'Report',
              fontWeight: FontWeight.w700,
              fontSize: 21.2.sp,
              color: AppColor.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .75,
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: mapList.length,
                itemBuilder: (context, index) {
                  return reportContent(
                      text: mapList[index]['text'],
                      svg: mapList[index]['svg'],
                      color: mapList[index]['color'],
                      v: () {
                        onTapReportWidget(mapList[index]['text']);
                      });
                },
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
          ],
        ),
      ),
    );
  }

  onTapReportWidget(e) {
    if (e == 'Revenue') {
      Get.to(() => ReportRevenue(),
          transition: Transition.native, duration: const Duration(seconds: 1));
    } else if (e == 'Finance(Profit & Loss)') {
      Get.to(() => ProfitAndLossScreen(),
          transition: Transition.leftToRightWithFade,
          duration: const Duration(seconds: 1));
    } else if (e == 'Generate Guest List') {
      Get.to(() => GuestListScreen(),
          transition: Transition.downToUp,
          duration: const Duration(seconds: 1));
    }
    if (e == 'Generate Payroll Report') {
      AppUtils.snackbar(context, message: "Payroll is unavailable now..!");
    }
    setState(() {});
  }

  reportContent(
          {required String svg,
          required String text,
          required Color? color,
          required Function() v}) =>
      GestureDetector(
        onTap: v,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 52.8.w, bottom: 26.0.w),
                  padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryGrey1.withOpacity(.36),
                  ),
                  child: SizedBox(
                    child: SvgPicture.asset(
                      svg,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 140.w,
                    child: TextView(
                      textAlign: TextAlign.center,
                      text: text,
                      maxLines: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
