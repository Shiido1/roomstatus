import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/screens/authentication/login/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_assets/app_color.dart';
import '../widgets/text_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int screen = 1;
  List<String> image = [AppImage.ob1, AppImage.ob2, AppImage.ob3];

  String a1 = 'Built to help you Succeed';
  String b1 = 'Your Business Growth';
  String c1 = 'Friendly & Cost Effective';

  String a =
      'RoomStatus cloud-based hotel management system comes with next-gen capabilities to help you automate and streamline your daily routines';
  String b =
      'Roomstatus PMS is an innovative hospitality management system that enables automation to boost revenue and cause remarkable guest experiences.';
  String c =
      'Simplify your operations, increase your profits and skyrocket your property’s performance. Its a user-friendly, all-inclusive,  cost-effective solution';

  List<String>? text;
  List<String>? text1;

  @override
  void initState() {
    text = [a, b, c];
    text1 = [a1, b1, c1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (screen < 3) {
          screen += 1;
        } else {
          Get.to(() => UserLoginScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(seconds: 1));
        }
        setState(() {});
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(fit: StackFit.passthrough, children: [
            Image.asset(
              image[screen - 1],
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned.fill(
              bottom: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(14.20.w),
                    padding: EdgeInsets.only(
                        top: 16.2.w, right: 16.2.w, left: 16.2.w, bottom: 4.w),
                    decoration: BoxDecoration(
                      color: AppColor.ongrey.withOpacity(.7),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: TextView(
                            text: text1![screen - 1],
                            fontSize: 25.2.sp,
                            maxLines: 2,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextView(
                          text: text![screen - 1],
                          fontSize: 15.2.sp,
                          textAlign: TextAlign.start,
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(AppImage.nextObIcon)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
