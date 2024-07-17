import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'text_widget.dart';

class PrintButtonWidget extends StatelessWidget {
  const PrintButtonWidget(
      {super.key,
      this.buttonText,
      this.color,
      this.buttonColor,
      this.buttonHeight = 50,
      this.buttonWidth = 328,
      this.isLight = true,
      this.buttonBorderColor,
      this.border = 10.0,
      this.onPressed,
      this.widget,
      this.isLoading = false});
  final String? buttonText;
  final double? border;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final bool? isLight;
  final bool? isLoading;
  final Widget? widget;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: buttonWidth!.w, height: buttonHeight!.h),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColor!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(border!),
                      side:
                          BorderSide(color: buttonBorderColor!, width: 1.w)))),
          child: isLoading == false || isLoading == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: buttonText!,
                      fontSize: 16.sp,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    widget!
                  ],
                )
              : SpinKitThreeBounce(
                  color: color!,
                  size: 24,
                )),
    );
  }
}
