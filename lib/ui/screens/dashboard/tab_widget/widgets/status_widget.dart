import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class StatusWidget extends StatefulWidget {
  StatusWidget({
    super.key,
    required this.text,
    required this.text1,
    required this.callback,
  });
  String? text;
  String? text1;
  Function() callback;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  Color? getColor(String text) {
    Color color = Colors.transparent;
    if (text == 'ALL') {
      color = AppColor.deepprimary;
    }
    if (text == 'AVAILABLE') {
      color = AppColor.grey;
    }
    if (text == 'REPAIR') {
      color = AppColor.black;
    }
    if (text == 'UNPAID') {
      color = AppColor.yellow;
    }
    if (text == 'PAID') {
      color = AppColor.green;
    }
    if (text == 'OCCUPIED') {
      color = AppColor.red;
    }
    if (text == 'DIRTY') {
      color = AppColor.redBrown;
    }
    setState(() {});

    return color;
  }

  Color? getColorText(String text) {
    Color color = Colors.white;
    if (text == 'AVAILABLE' || text == 'UNPAID') {
      color = AppColor.black;
    }
    setState(() {});

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding:
            EdgeInsets.only(top: 6.w, bottom: 6.w, left: 12.w, right: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: getColor(widget.text!)),
        child: TextView(
          text: widget.text1!,
          fontSize: 13.2.sp,
          color: getColorText(widget.text!),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
