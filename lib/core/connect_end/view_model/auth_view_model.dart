// ignore_for_file: collection_methods_unrelated_type

import 'dart:io';

import 'package:roomstatus/core/connect_end/model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_country_model/datum.dart'
    as country;
import 'package:roomstatus/core/connect_end/model/get_room_response_model/get_room_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_state_response_model/datum.dart'
    as state;
import 'package:roomstatus/core/connect_end/model/get_cities_response_model/datum.dart'
    as city;
import 'package:roomstatus/core/connect_end/model/get_country_model/get_country_model.dart';
import 'package:roomstatus/core/connect_end/model/get_profile_response_model/get_profile_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_state_response_model/get_state_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_status_response_model/get_status_response_model.dart';
import 'package:roomstatus/core/connect_end/model/login_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/otp_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/otp_response_model/otp_response_model.dart';
import 'package:roomstatus/core/connect_end/model/recent_otp_response_model/recent_otp_response_model.dart';
import 'package:roomstatus/ui/app_assets/image_picker.dart';
import 'package:roomstatus/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/image.dart';
import '../../../ui/screens/authentication/login/user_login_screen.dart';
import '../../../ui/widgets/button_widget.dart';
import '../../../ui/widgets/text_form_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preferance.dart';
import '../model/get_all_rooms_response_model/room.dart';
import '../model/get_cities_response_model/get_cities_response_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/registration_entity_model.dart';
import '../model/registration_response_model/registration_response_model.dart';
import '../model/resent_otp_entity_model.dart';
import '../repo/repo_implementation.dart';
import "package:collection/collection.dart";

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingResend => _isLoadingResend;
  bool _isLoadingResend = false;
  bool get isLoadingCountry => _isLoadingCountry;
  bool _isLoadingCountry = false;
  bool get isCountry => _isCountry;
  bool _isCountry = false;
  bool get isLoadingCity => _isLoadingCity;
  bool _isLoadingCity = false;
  bool get isCity => _isCity;
  bool _isCity = false;
  bool get isLoadingState => _isLoadingState;
  bool _isLoadingState = false;
  bool get isState => _isState;
  bool _isState = false;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;
  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;

  RegistrationResponseModel? get registrationResponse => _registrationResponse;
  RegistrationResponseModel? _registrationResponse;

  GetCountryModel? _countryModel;
  GetCountryModel? get countryModel => _countryModel;

  List<country.Datum>? _countryModelList = [];
  List<country.Datum>? get countryModelLsit => _countryModelList;
  List<country.Datum>? _countryModelListCopy = [];
  List<state.Datum>? _stateModelList = [];
  List<state.Datum>? get stateModelLsit => _stateModelList;
  List<state.Datum>? _stateModelListCopy = [];
  List<city.Datum>? _cityModelList = [];
  List<city.Datum>? get cityModelLsit => _cityModelList;
  List<city.Datum>? _cityModelListCopy = [];

  List<Room>? _rooms = [];
  List<Room>? get rooms => _rooms;

  GetAllRoomsResponseModel? _allRoomsResponseModel;
  GetAllRoomsResponseModel? get allRoomsResponseModel => _allRoomsResponseModel;
  GetRoomResponseModel? _getRoomResponseModel;
  GetRoomResponseModel? get getRoomResponse => _getRoomResponseModel;
  GetStatusResponseModel? _getStatusResponseModel;
  GetStatusResponseModel? get getStatusResponseModel => _getStatusResponseModel;

  GetStateResponseModel? _stateModel;
  GetStateResponseModel? get stateModel => _stateModel;
  GetCitiesResponseModel? _cityModel;
  GetCitiesResponseModel? get cityModel => _cityModel;

  LoginResponseModel? get loginResponse => _loginResponse;
  LoginResponseModel? _loginResponse;

  OtpResponseModel? _otpResponseModel;
  OtpResponseModel? get otpResponseModel => _otpResponseModel;
  RecentOtpResponseModel? _resendOtpModel;
  RecentOtpResponseModel? get resendOtpModel => _resendOtpModel;
  GetProfileResponseModel? _getProfileResponseModel;
  GetProfileResponseModel? get getProfileResponseModel =>
      _getProfileResponseModel;

  // GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  // GlobalKey<FormState> formKeyRegisterSecond = GlobalKey<FormState>();
  // GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();

  File? _imageFile;
  File? get imageFile => _imageFile;
  final _pickImage = ImagePickerHandler();
  int pageCountry = 1;
  int pageCity = 1;
  int pageState = 1;

  bool isLoadNoMoreCountry = false;
  bool isLoadNoMoreCity = false;
  bool isLoadNoMoreState = false;

  bool? get isStatusTapped => _isStatusTapped;
  bool? _isStatusTapped = false;

  String _query = '';
  String get query => _query;

  DateTime selectedDate = DateTime.now();
  String? _formattedDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
  String? get formattedDate => _formattedDate;

  bool getStatusTapped(v) {
    if (v) {
      _isStatusTapped = true;
    } else {
      _isStatusTapped = false;
    }
    notifyListeners();
    return _isStatusTapped!;
  }

  String statusSvg(String roomsStatus) {
    if (roomsStatus == 'available') {
      return AppImage.availablestatus;
    }
    if (roomsStatus == 'repair') {
      return AppImage.repairstatus;
    }
    if (roomsStatus == 'unpaid') {
      return AppImage.unpaidstatus;
    }
    if (roomsStatus == 'paid') {
      return AppImage.paidstatus;
    }
    if (roomsStatus == 'occupied') {
      return AppImage.occupiedstatus;
    }
    if (roomsStatus == 'dirty') {
      return AppImage.dirtystatus;
    }

    notifyListeners();
    return '';
  }

  Color statusColor(String roomsStatus) {
    if (roomsStatus == 'available') {
      return AppColor.grey;
    }
    if (roomsStatus == 'repair') {
      return AppColor.black;
    }
    if (roomsStatus == 'unpaid') {
      return AppColor.yellow;
    }
    if (roomsStatus == 'paid') {
      return AppColor.green;
    }
    if (roomsStatus == 'occupied') {
      return AppColor.red;
    }
    if (roomsStatus == 'dirty') {
      return AppColor.redBrown;
    }

    notifyListeners();
    return AppColor.deepprimary;
  }

  Color statusColorText(String roomsStatus) {
    if (roomsStatus == 'available') {
      return AppColor.black;
    }
    if (roomsStatus == 'repair') {
      return AppColor.white;
    }
    if (roomsStatus == 'unpaid') {
      return AppColor.white;
    }
    if (roomsStatus == 'paid') {
      return AppColor.black;
    }
    if (roomsStatus == 'occupied') {
      return AppColor.white;
    }
    if (roomsStatus == 'dirty') {
      return AppColor.white;
    }

    notifyListeners();
    return AppColor.deepprimary;
  }

  Future<void> selectDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      _formattedDate = DateFormat('EEEE, d MMM yyyy').format(selectedDate);
      getAllRooms(context, date: selectedDate.toString().substring(0, 10));
      notifyListeners();
    }
  }

  groupRoom(status) {
    var groupedValue;

    groupedValue =
        groupBy(_allRoomsResponseModel!.data!.rooms!, (obj) => obj.status);
    _rooms!.clear();
    if (status == 'ALL') {
      _rooms!.addAll(_allRoomsResponseModel!.data!.rooms!);
    } else if (status == 'AVAILABLE') {
      _rooms!.addAll(groupedValue['available'] ?? []);
    } else if (status == 'REPAIR') {
      _rooms!.addAll(groupedValue['repair'] ?? []);
    } else if (status == 'UNPAID') {
      _rooms!.addAll(groupedValue['unpaid'] ?? []);
    } else if (status == 'PAID') {
      _rooms!.addAll(groupedValue['paid'] ?? []);
    } else if (status == 'OCCUPIED') {
      _rooms!.addAll(groupedValue['occupied'] ?? []);
    } else if (status == 'DIRTY') {
      _rooms!.addAll(groupedValue['dirty'] ?? []);
    }
    notifyListeners();
  }

  getRoomsWidget({String? roomname, String? roomType}) => SvgPicture.asset(
        roomname!,
        height: 100.h,
        width: 100.w,
      );

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  bool isOnTogglePasswordConfirm() {
    _isTogglePasswordConfirm = !_isTogglePasswordConfirm;
    notifyListeners();
    return _isTogglePasswordConfirm;
  }

  // login flow so api call for method can be called here

  Future<void> loginUser(LoginEntityModel loginEntity, contxt) async {
    try {
      _isLoading = true;
      _loginResponse = await runBusyFuture(repositoryImply.login(loginEntity),
          throwException: true);

      if (_loginResponse?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _loginResponse?.message!.toString());
        Get.to(() => const Dashboard(),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
  // otp flow so api call for method can be called here

  Future<void> otpVerify(OtpEntityModel otpEntity, contxt) async {
    try {
      _isLoading = true;
      _otpResponseModel = await runBusyFuture(repositoryImply.otp(otpEntity),
          throwException: true);

      if (_otpResponseModel?.success == true) {
        _isLoading = false;
        Get.to(() => const Dashboard(),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 2));
        AppUtils.snackbar(contxt,
            message: _otpResponseModel?.message!.toString());
        profile(contxt);
        getStatus(contxt, date: DateTime.now().toString().substring(0, 10));
        getAllRooms(contxt, date: DateTime.now().toString().substring(0, 10));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
  // resend opt flow so api call for method can be called here

  Future<void> resend(ResentOtpEntityModel resendOtpEntity, contxt) async {
    try {
      _isLoadingResend = true;
      _resendOtpModel = await runBusyFuture(
          repositoryImply.resendOtp(resendOtpEntity),
          throwException: true);

      if (_resendOtpModel?.success == true) {
        _isLoadingResend = false;
        AppUtils.snackbar(
          contxt,
          message: _resendOtpModel?.message ?? '',
        );
      }
    } catch (e) {
      _isLoadingResend = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
  // get user profile flow so api call method can be called here

  Future<void> profile(contxt) async {
    try {
      _isLoading = true;
      _getProfileResponseModel =
          await runBusyFuture(repositoryImply.profile(), throwException: true);
      logger.d(_getProfileResponseModel!.data);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getImage(context) async {
    try {
      await _pickImage.pickImage(
          context: context,
          file: (file) {
            _imageFile = file;
            notifyListeners();
          });
      logger.d(_imageFile);
    } catch (e) {
      logger.e(e);
    }
  }

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  Future<void> signUpUser(
      RegistrationEntityModel registerEntity, contxt) async {
    try {
      _isLoading = true;
      _registrationResponse = await runBusyFuture(
          repositoryImply.register(registerEntity),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _registrationResponse?.message!.toString());
      if (_registrationResponse?.success == true) {
        Get.to(() => UserLoginScreen(),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getCountries({String? country, contxt}) async {
    try {
      _isLoadingCountry = true;
      _isCountry = false;
      // ignore: unnecessary_null_comparison
      if (country != '') {
        _countryModel = await runBusyFuture(
            repositoryImply.country(
                country: country, page: pageCountry.toString()),
            throwException: true);
        _countryModelList = _countryModel!.data;
        _isLoadingCountry = false;
        if (_countryModel!.data!.isNotEmpty) {
          _isCountry = true;
        }
      } else {
        _isLoadingCountry = false;
        return;
      }
    } catch (e) {
      _isLoadingCountry = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshCountry() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingCountry(country) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_countryModel!.data!.length < _countryModel!.meta!.total!) {
      pageCountry++;
      try {
        _countryModel = await runBusyFuture(repositoryImply.country(
            country: country, page: pageCountry.toString()));
        _countryModelListCopy!.addAll(_countryModel!.data!);
        _countryModelList!.addAll(_countryModelListCopy!);
        _countryModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreCountry = true;
      null;
    }
    notifyListeners();
  }

  Future<void> getState({String? state, contxt}) async {
    try {
      _isLoadingState = true;
      _isState = false;
      // ignore: unnecessary_null_comparison
      if (state != '') {
        _stateModel = await runBusyFuture(
            repositoryImply.state(state: state, page: pageState.toString()),
            throwException: true);
        _stateModelList = _stateModel!.data;
        _isLoadingState = false;
        if (_stateModel!.data!.isNotEmpty) {
          _isState = true;
        }
      } else {
        _isLoadingState = false;
        return;
      }
    } catch (e) {
      _isLoadingState = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshState() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingState(state) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_stateModel!.data!.length < _stateModel!.meta!.total!) {
      pageState++;
      try {
        _stateModel = await runBusyFuture(
            repositoryImply.state(state: state, page: pageState.toString()));
        _stateModelListCopy!.addAll(_stateModel!.data!);
        _stateModelList!.addAll(_stateModelListCopy!);
        _stateModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreState = true;
      null;
    }
    notifyListeners();
  }

  Future<void> getCities({String? cities, contxt}) async {
    try {
      _isLoadingCity = true;
      _isCity = false;
      // ignore: unnecessary_null_comparison
      if (cities != '') {
        _cityModel = await runBusyFuture(
            repositoryImply.cities(cities: cities, page: pageCity.toString()),
            throwException: true);
        _isLoadingCity = false;
        _cityModelList = _cityModel!.data;
        if (_cityModel!.data!.isNotEmpty) {
          _isCity = true;
        }
      } else {
        _isLoadingCity = false;
        return;
      }
    } catch (e) {
      _isLoadingCity = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshCity() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingCity(city) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_cityModel!.data!.length < _cityModel!.meta!.total!) {
      pageCity++;
      try {
        _cityModel = await runBusyFuture(
            repositoryImply.cities(cities: city, page: pageCity.toString()));
        _cityModelListCopy!.addAll(_cityModel!.data!);
        _cityModelList!.addAll(_cityModelListCopy!);
        _cityModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreCity = true;
      null;
    }
    notifyListeners();
  }

  ondisposePageNumebr() {
    pageCity = 1;
    pageCity = 1;
    pageCountry = 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> getStatus(BuildContext context, {String? date}) async {
    try {
      _isLoading = true;
      _getStatusResponseModel = await runBusyFuture(
          repositoryImply.status(date),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getRoom(BuildContext context, {String? date, String? id}) async {
    try {
      _isLoading = true;
      _getRoomResponseModel = await runBusyFuture(
          repositoryImply.room(date, id!),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllRooms(BuildContext context, {String? date}) async {
    try {
      _isLoading = true;
      _isStatusTapped = false;
      _allRoomsResponseModel = await runBusyFuture(repositoryImply.rooms(date),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  final TextEditingController searchController = TextEditingController();
  searchFormField() => Expanded(
        child: TextFormWidget(
            label: 'Search rooms or reservations',
            textCapitalization: TextCapitalization.words,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.2.sp,
                color: AppColor.black),
            fillColor: AppColor.white.withOpacity(.4),
            isFilled: true,
            prefixWidget: Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset(
                AppImage.search,
                color: AppColor.white,
              ),
            ),
            prefixIconColor: AppColor.white,
            controller: searchController,
            onChange: (o) {
              _query = o;
              notifyListeners();
            }),
      );

  void displaylogoutModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColor.primary,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: .2,
              maxChildSize: .3,
              minChildSize: .1,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Log Out',
                          color: AppColor.white,
                          border: 24,
                          buttonWidth: double.infinity,
                          buttonColor: AppColor.primary1,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            SharedPreferencesService.instance.logOut();
                          }),
                      SizedBox(
                        height: 10.2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
