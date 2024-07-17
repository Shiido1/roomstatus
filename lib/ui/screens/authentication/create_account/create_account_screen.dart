// ignore_for_file: use_build_context_synchronously

import 'package:roomstatus/ui/app_assets/app_color.dart';
import 'package:roomstatus/ui/app_assets/app_utils.dart';
import 'package:roomstatus/ui/app_assets/image.dart';
import 'package:roomstatus/ui/widgets/text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validation.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_widget.dart';
import '../login/user_login_screen.dart';
import 'create_account_second_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late Debouncer _debouncer;
  bool isCountryTapped = false;
  bool isCityTapped = false;
  bool isStateTapped = false;
  String? country;
  String? countryText;
  String? city;
  String? cityText;
  String? state;
  String? stateText;

  RefreshController? refreshControllerCountry = RefreshController();
  RefreshController? refreshControllerState = RefreshController();
  RefreshController? refreshControllerCity = RefreshController();

  TextEditingController hotelNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  @override
  void initState() {
    _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    hotelNameController.text = '';
    countryController.text = '';
    stateController.text = '';
    cityController.text = '';
    addressController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) async {},
        disposeViewModel: false,
        onDispose: (viewModel) => viewModel.ondisposePageNumebr(),
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.primary,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
              child: Center(
                child: Form(
                  key: formKeyRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      TextView(
                        text: 'Create an Account',
                        fontSize: 23.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Center(child: SvgPicture.asset(AppImage.createvecone)),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Hotel Information',
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                          TextView(
                            text: 'Personal Information',
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Hotel Name',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        controller: hotelNameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Country',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        suffixWidget: model.isLoadingCountry
                            ? SpinKitRipple(
                                color: AppColor.deepprimary,
                                size: 20.sp,
                              )
                            : const Icon(Icons.keyboard_arrow_down),
                        suffixIconColor: AppColor.black,
                        controller: countryController,
                        onChange: (p0) {
                          _debouncer.call(() {
                            countryText = p0;
                            setState(() {});
                            model.getCountries(country: p0, contxt: context);
                            isCountryTapped = false;
                            model.notifyListeners();
                          });
                        },
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height:
                            model.isCountry && !isCountryTapped ? 20.h : 0.h,
                      ),
                      model.isCountry && !isCountryTapped
                          ? Container(
                              height: model.countryModelLsit!.length > 3
                                  ? 200.h
                                  : 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SmartRefresher(
                                key: const PageStorageKey('storage_key'),
                                enablePullUp: true,
                                enablePullDown: false,
                                onRefresh: () async {
                                  await model.onRefreshCountry();
                                  model.getCountries(
                                      country: countryText, contxt: context);
                                  refreshControllerCountry?.refreshCompleted();
                                },
                                onLoading: () async {
                                  await model.onLoadingCountry(countryText);
                                  refreshControllerCountry?.loadComplete();
                                },
                                controller: refreshControllerCountry!,
                                footer: CustomFooter(builder: ((context, mode) {
                                  Widget body;
                                  if (model.countryModel != null &&
                                      model.countryModel!.data!.isEmpty) {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.idle &&
                                      model.isLoadNoMoreCountry == false) {
                                    body = TextView(
                                      text: "Pull up load",
                                      color: AppColor.textColor,
                                    );
                                  } else if (mode == LoadStatus.loading) {
                                    body = const CupertinoActivityIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = TextView(
                                        text: "Load Failed!Click retry!",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = TextView(
                                        text: "release to load more",
                                        color: AppColor.textColor);
                                  } else {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  }
                                  return SizedBox(
                                    height: 50.0,
                                    child: Center(child: body),
                                  );
                                })),
                                child: SingleChildScrollView(
                                  padding:
                                      EdgeInsets.only(bottom: 10.w, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ...model.countryModelLsit!
                                          .map((e) => GestureDetector(
                                                onTap: () {
                                                  isCountryTapped =
                                                      !isCountryTapped;
                                                  countryController.text =
                                                      e.name ?? '';
                                                  country = e.id.toString();
                                                  setState(() {});
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: TextView(
                                                    text: e.name ?? '',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'State/Province',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        readOnly: true,
                        suffixWidget: model.isLoadingState
                            ? SpinKitRipple(
                                color: AppColor.deepprimary,
                                size: 20.sp,
                              )
                            : IconButton(
                                onPressed: () {
                                  model.getState(
                                      state: country!, contxt: context);
                                  isStateTapped = false;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.keyboard_arrow_down)),
                        suffixIconColor: AppColor.black,
                        controller: stateController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: model.isState && !isStateTapped ? 20.h : 0.h,
                      ),
                      model.isState && !isStateTapped
                          ? Container(
                              height: model.stateModelLsit!.length > 3
                                  ? 200.h
                                  : 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SmartRefresher(
                                key: const PageStorageKey('storage_key_state'),
                                enablePullUp: true,
                                enablePullDown: false,
                                onRefresh: () async {
                                  await model.onRefreshState();
                                  model.getState(
                                      state: country, contxt: context);
                                  refreshControllerState?.refreshCompleted();
                                },
                                onLoading: () async {
                                  await model.onLoadingState(state);
                                  refreshControllerState?.loadComplete();
                                },
                                controller: refreshControllerState!,
                                footer: CustomFooter(builder: ((context, mode) {
                                  Widget body;
                                  if (model.stateModel != null &&
                                      model.stateModel!.data!.isEmpty) {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.idle &&
                                      model.isLoadNoMoreState == false) {
                                    body = TextView(
                                      text: "Pull up load",
                                      color: AppColor.textColor,
                                    );
                                  } else if (mode == LoadStatus.loading) {
                                    body = const CupertinoActivityIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = TextView(
                                        text: "Load Failed!Click retry!",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = TextView(
                                        text: "release to load more",
                                        color: AppColor.textColor);
                                  } else {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  }
                                  return SizedBox(
                                    height: 50.0,
                                    child: Center(child: body),
                                  );
                                })),
                                child: SingleChildScrollView(
                                  padding:
                                      EdgeInsets.only(bottom: 10.w, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ...model.stateModelLsit!
                                          .map((e) => GestureDetector(
                                                onTap: () {
                                                  isStateTapped =
                                                      !isStateTapped;
                                                  stateController.text =
                                                      e.name ?? '';
                                                  state = e.id!.toString();
                                                  setState(() {});
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: TextView(
                                                    text: e.name ?? '',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'City/Town',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        suffixWidget: model.isLoadingCity
                            ? SpinKitRipple(
                                color: AppColor.deepprimary,
                                size: 20.sp,
                              )
                            : IconButton(
                                onPressed: () {
                                  model.getCities(
                                      cities: state!, contxt: context);
                                  isCityTapped = false;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.keyboard_arrow_down)),
                        suffixIconColor: AppColor.black,
                        controller: cityController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: model.isCity && !isCityTapped ? 20.h : 0.h,
                      ),
                      model.isCity && !isCityTapped
                          ? Container(
                              height: model.cityModelLsit!.length > 3
                                  ? 200.h
                                  : 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SmartRefresher(
                                key: const PageStorageKey('storage_key_city'),
                                enablePullUp: true,
                                enablePullDown: false,
                                onRefresh: () async {
                                  await model.onRefreshCity();
                                  model.getCities(
                                      cities: state, contxt: context);
                                  refreshControllerCity?.refreshCompleted();
                                },
                                onLoading: () async {
                                  await model.onLoadingCity(state);
                                  refreshControllerCity?.loadComplete();
                                },
                                controller: refreshControllerCity!,
                                footer: CustomFooter(builder: ((context, mode) {
                                  Widget body;
                                  if (model.cityModel != null &&
                                      model.cityModel!.data!.isEmpty) {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.idle &&
                                      model.isLoadNoMoreCity == false) {
                                    body = TextView(
                                      text: "Pull up load",
                                      color: AppColor.textColor,
                                    );
                                  } else if (mode == LoadStatus.loading) {
                                    body = const CupertinoActivityIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = TextView(
                                        text: "Load Failed!Click retry!",
                                        color: AppColor.textColor);
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = TextView(
                                        text: "release to load more",
                                        color: AppColor.textColor);
                                  } else {
                                    body = TextView(
                                        text: "You're caught up",
                                        color: AppColor.textColor);
                                  }
                                  return SizedBox(
                                    height: 50.0,
                                    child: Center(child: body),
                                  );
                                })),
                                child: SingleChildScrollView(
                                  padding:
                                      EdgeInsets.only(bottom: 10.w, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ...model.cityModelLsit!
                                          .map((e) => GestureDetector(
                                                onTap: () {
                                                  isCityTapped = !isCityTapped;
                                                  cityController.text =
                                                      e.name ?? '';
                                                  city = e.id!.toString();
                                                  setState(() {});
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: TextView(
                                                    text: e.name ?? '',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Address',
                        label: 'Select Service',
                        hintColor: AppColor.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.2.sp,
                            color: AppColor.inGrey),
                        fillColor: AppColor.white,
                        isFilled: true,
                        suffixIcon: Icons.keyboard_arrow_down,
                        suffixIconColor: AppColor.black,
                        controller: addressController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: model.imageFile != null ? 20.h : 30.h,
                      ),
                      model.imageFile != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: Image.file(
                                  model.imageFile!,
                                  fit: BoxFit.cover,
                                  height: 140.h,
                                  width: double.infinity,
                                ),
                              ))
                          : GestureDetector(
                              onTap: () => model.getImage(context),
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(5.r),
                                  dashPattern: const [5, 5],
                                  color: AppColor.white,
                                  strokeWidth: 1,
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.w, bottom: 20.w),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.phot,
                                          width: 40.w,
                                          height: 40.h,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextView(
                                          text: 'Add Your Hotel Logo',
                                          fontSize: 17.0.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.white,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextView(
                                          text: 'Click here to upload image',
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.white,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        )
                                      ],
                                    ),
                                  ))),
                            ),
                      SizedBox(
                        height: model.imageFile != null ? 30.h : 40.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Proceed',
                          color: AppColor.white,
                          border: 24,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.deepprimary,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKeyRegister.currentState!.validate() &&
                                model.imageFile != null) {
                              Get.to(
                                  () => CreateAccountSecondScreen(
                                        state: state,
                                        hotelname:
                                            hotelNameController.text.trim(),
                                        country: country,
                                        city: city,
                                        address: addressController.text.trim(),
                                      ),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 2));
                            } else {
                              AppUtils.snackbar(context,
                                  message: 'Fill in the required Field',
                                  error: true);
                            }
                          }),
                      SizedBox(
                        height: 18.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => UserLoginScreen(),
                                transition: Transition.fadeIn,
                                duration: const Duration(seconds: 2));
                          },
                          child: TextView(
                            text: 'Already have an Account Login here',
                            fontSize: 15.2.sp,
                            color: AppColor.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
