import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LinearStatusWidget extends StatefulWidget {
  LinearStatusWidget({
    super.key,
    required this.text,
    required this.callback,
    required this.color,
  });
  String? text;
  Color? color;
  Function() callback;

  @override
  State<LinearStatusWidget> createState() => _LinearStatusWidgetState();
}

class _LinearStatusWidgetState extends State<LinearStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding:
            EdgeInsets.only(top: 6.w, bottom: 6.w, left: 12.w, right: 12.w),
        decoration: BoxDecoration(
            border: Border.all(color: widget.color!),
            borderRadius: BorderRadius.circular(20)),
        child: TextView(
          text: widget.text!,
          fontSize: 13.2.sp,
          color: widget.color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
