import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            TextView(
              text: 'Coming Soon...!',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}
