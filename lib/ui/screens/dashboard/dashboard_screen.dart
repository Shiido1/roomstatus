import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_assets/app_color.dart';
import '../../app_assets/image.dart';
import '../../widgets/text_widget.dart';
import 'home_rooom_reservaton_screen.dart/home_screen.dart';
import 'pos/point_of_sales_screen.dart';
import 'report/report_screen.dart';
import 'reservation_screen.dart/room_reservation_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    const HomeRoomReservationScreen(),
    const RoomReservationScreen(),
    const ReportScreen(),
    const POSScreen(),
  ];

  Future<bool> willPopControl() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: TextView(
                    text: 'Do you want to exit the app',
                    textAlign: TextAlign.center,
                    fontSize: 18.0.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.red, // Text Color
                          ),
                          child: TextView(
                            text: 'No',
                            fontSize: 20.sp,
                            color: AppColor.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () => exitApp(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.deepprimary, // Text Color
                          ),
                          child: TextView(
                            text: 'Yes',
                            fontSize: 20.sp,
                            color: AppColor.green9ja,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ))) ??
        false;
  }

  exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        body: Center(
          child: _body[_currentIndex],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: AppColor.transparent,
            highlightColor: AppColor.transparent,
          ),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: AppColor.primary,
              selectedItemColor: AppColor.white,
              unselectedItemColor: AppColor.black,
              selectedLabelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              unselectedLabelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      _currentIndex == 0 ? AppImage.room : AppImage.rRoom,
                      color:
                          _currentIndex == 0 ? AppColor.white : AppColor.black),
                  label: 'Room',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      _currentIndex == 1
                          ? AppImage.reservation
                          : AppImage.rReservation,
                      color:
                          _currentIndex == 1 ? AppColor.white : AppColor.black),
                  label: 'Reservation',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      _currentIndex == 2 ? AppImage.report : AppImage.rReport,
                      color:
                          _currentIndex == 2 ? AppColor.white : AppColor.black),
                  label: 'Report',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      _currentIndex == 3 ? AppImage.pos : AppImage.pPos,
                      color:
                          _currentIndex == 3 ? AppColor.white : AppColor.black),
                  label: 'Pos',
                )
              ]),
        ),
      ),
    );
  }
}
