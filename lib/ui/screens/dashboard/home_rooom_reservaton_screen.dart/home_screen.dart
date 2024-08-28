// ignore_for_file: use_build_context_synchronously

import 'package:roomstatus/core/core_folder/manager/shared_preferance.dart';
import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../tab_widget/first_tab_screen.dart';
import '../tab_widget/second_tab_screen.dart';

class HomeRoomReservationScreen extends StatefulWidget {
  const HomeRoomReservationScreen({super.key});

  @override
  State<HomeRoomReservationScreen> createState() =>
      _HomeRoomReservationScreenState();
}

class _HomeRoomReservationScreenState extends State<HomeRoomReservationScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String now = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) {
          if (SharedPreferencesService.instance.isLoggedIn == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.profile(context);
              await model.getStatus(context, date: now);
              model.getAllRooms(context, date: now);
            });
          }
        },
        builder: (_, AuthViewModel model, __) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppColor.primary,
              body: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 30.2.w, horizontal: 16.8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: TextView(
                            text: model.getProfileResponseModel?.data?.hotel
                                    ?.toUpperCase() ??
                                '',
                            fontWeight: FontWeight.w700,
                            maxLines: 1,
                            color: AppColor.white,
                            textOverflow: TextOverflow.fade,
                            fontSize: 22.sp,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: 100,
                          child: model.getProfileResponseModel?.data?.hotel ==
                                  null
                              ? GestureDetector(
                                  onTap: () => model
                                      .displaylogoutModalBottomSheet(context),
                                  child: Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.white),
                                      shape: BoxShape.circle,
                                      color: AppColor.fadeddeepprimary,
                                    ),
                                    child: SvgPicture.asset(AppImage.profile),
                                  ),
                                )
                              : !model.getProfileResponseModel!.data!.hotelLogo!
                                          .contains('http') ||
                                      model.getProfileResponseModel!.data!
                                              .image ==
                                          null
                                  ? GestureDetector(
                                    onTap:()=> model.displaylogoutModalBottomSheet(
                                              context),
                                    child: Container(
                                        padding: EdgeInsets.all(6.4.w),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3.w,
                                                color: AppColor.white),
                                            shape: BoxShape.circle),
                                        child: TextView(
                                          text: getInitials(
                                              string: model
                                                      .getProfileResponseModel
                                                      ?.data
                                                      ?.hotel
                                                      ?.toUpperCase() ??
                                                  '',
                                              limitTo: 1),
                                          fontWeight: FontWeight.w700,
                                          maxLines: 1,
                                          color: AppColor.white,
                                          textOverflow: TextOverflow.fade,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                  )
                                  : GestureDetector(
                                      onTap: () =>
                                          model.displaylogoutModalBottomSheet(
                                              context),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppColor.white.withOpacity(.7),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(model
                                                      .getProfileResponseModel
                                                      ?.data
                                                      ?.hotelLogo ??
                                                  ''),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TabBar(
                        controller: tabController,
                        tabAlignment: TabAlignment.start,
                        indicatorWeight: 0,
                        dividerColor: AppColor.transparent,
                        labelColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontSize: 15.6.sp, fontWeight: FontWeight.w500),
                        unselectedLabelColor: AppColor.black,
                        indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2,
                              color: AppColor.white,
                            ),
                            insets: EdgeInsets.zero),
                        isScrollable: true,
                        labelPadding: const EdgeInsets.only(left: 0, right: 20),
                        indicatorColor: AppColor.transparent,
                        tabs: const [
                          Tab(
                            text: 'Room Reservation',
                          ),
                          Tab(
                            text: 'Hall Reservation',
                          ),
                        ]),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.75,
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          FirstTabScreen(),
                          SecondTabScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  String getInitials({String? string, int? limitTo}) {
    var buffer = StringBuffer();
    var split = string!.split(' ');
    for (var i = 0; i < (limitTo ?? split.length); i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }
}
