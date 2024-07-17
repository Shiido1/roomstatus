import 'package:roomstatus/core/connect_end/model/add_booking_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/add_booking_response_model/add_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/check_in_response_model/check_in_response_model.dart';
import 'package:roomstatus/core/connect_end/model/checked_out_response_model/checked_out_response_model.dart';
import 'package:roomstatus/core/connect_end/model/delete_booking_response_model/delete_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/find_customer_responsse_model/data.dart';
import 'package:roomstatus/core/connect_end/model/get_all_bookings_response_model/get_all_bookings_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_dues_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/show_booking_response_model/show_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/update_booking_entity_model.dart';
import 'package:roomstatus/core/connect_end/repo/booking_repo_impl.dart';
import 'package:roomstatus/core/core_folder/app/app.router.dart';
import 'package:roomstatus/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:stacked/stacked.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/widgets/text_widget.dart';
import '../../constants.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/find_customer_responsse_model/find_customer_responsse_model.dart';
import '../model/get_cities_response_model/get_cities_response_model.dart';
import '../model/get_corp_company_model/get_corp_company_model.dart';
import '../model/get_due_response_model/get_due_response_model.dart';
import '../model/get_occupied_bookings_response_model/get_occupied_bookings_response_model.dart';
import '../model/get_state_response_model/get_state_response_model.dart';
import '../model/id_card_reponse_model/id_card_reponse_model.dart';
import '../model/payment_mode_response_model/payment_mode_response_model.dart';
import '../model/update_booking_response_model/update_booking_response_model.dart';

class BookingViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('BookingViewModel');

  final repositoryImply = BookingRepoImpl();

  BookingViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingState => _isLoadingState;
  bool _isLoadingState = false;
  bool get isLoadingCity => _isLoadingCity;
  bool _isLoadingCity = false;

  DeleteBookingResponseModel? _deleteBookingResponseModel;
  PaymentModeResponseModel? _paymentModeResponseModel;
  PaymentModeResponseModel? get paymentModeResponseModel =>
      _paymentModeResponseModel;

  FindCustomerResponsseModel? _findCustomerResponsseModel;
  FindCustomerResponsseModel? get findCutomerResponseModel =>
      _findCustomerResponsseModel;

  IdCardReponseModel? _cardReponseModel;
  IdCardReponseModel? get cardResponse => _cardReponseModel;

  Data? _findCustomerData;
  Data? get findCustomerData => _findCustomerData;

  AddBookingResponseModel? _addBookingResponseModel;
  AddBookingResponseModel? get addBookingResponseModel =>
      _addBookingResponseModel;
  GetAllBookingsResponseModel? _getAllBookingsResponseModel;
  GetAllBookingsResponseModel? get getAllBookingsResponsemodel =>
      _getAllBookingsResponseModel;

  ////
  ///
  GetStateResponseModel? _stateModel;
  GetStateResponseModel? get stateModel => _stateModel;
  GetCitiesResponseModel? _cityModel;
  GetCitiesResponseModel? get cityModel => _cityModel;

  GetCorpCompanyModel? get corpCompanyModel => _corpCompanyModel;
  GetCorpCompanyModel? _corpCompanyModel;

  ShowBookingResponseModel? get showBookingResponseModel =>
      _showBookingResponseModel;
  ShowBookingResponseModel? _showBookingResponseModel;

  UpdateBookingResponseModel? _updateBookingResponseModel;
  UpdateBookingResponseModel? get updateBookingResponseModel =>
      _updateBookingResponseModel;

  GetOccupiedBookingsResponseModelList? get getOccupiedBookingsResponseModel =>
      _getOccupiedBookingResponseModel;
  GetOccupiedBookingsResponseModelList? _getOccupiedBookingResponseModel;

  CheckInResponseModel? _checkInResponseModel;
  CheckInResponseModel? get checkInResponseModel => _checkInResponseModel;

  CheckedOutResponseModel? _checkedOutResponseModel;
  CheckedOutResponseModel? get checkedOutResponseModel =>
      _checkedOutResponseModel;

  GetDueResponseModel? _getDueResponseModel;
  GetDueResponseModel? get getDuesResponseModel => _getDueResponseModel;

  TextEditingController checkOutController = TextEditingController();
  TextEditingController checkInController = TextEditingController();

  DateTime selectedCheckinDate = DateTime.now();

  DateTime selectedCheckoutDate = DateTime.now();

  String? _formattedCheckInDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  String? _formattedCheckOutDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectCheckInDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckinDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      _formattedCheckInDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckinDate);

      checkInController.text = _formattedCheckInDate!;
      notifyListeners();
    }
  }

  Future<void> selectCheckOutDate(BuildContext? context, String id) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckoutDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
      _formattedCheckOutDate =
          DateFormat('yyyy-MM-dd').format(selectedCheckoutDate);
      checkOutController.text = _formattedCheckOutDate!;

      getDues(
          context,
          GetDuesEntityModel(
              bookableId: id,
              checkedIn: checkInController.text.trim(),
              checkedOut: checkOutController.text.trim()));
      notifyListeners();
    }
  }

  bool? isDue = false;
  final pdf = pw.Document();

  Future<void> getDues(contxt, GetDuesEntityModel entity) async {
    try {
      _isLoading = true;
      _getDueResponseModel = await runBusyFuture(
          repositoryImply.getDues(entity),
          throwException: true);
      if (_getDueResponseModel?.success == true) {
        isDue = true;
        notifyListeners();
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(
        contxt,
        message: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> checkInBooking(contxt, code) async {
    try {
      _isLoading = true;
      _checkInResponseModel = await runBusyFuture(
          repositoryImply.checkedInCustomer(code),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(
        contxt,
        message: _checkInResponseModel?.message ?? '',
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> checkOutBooking(contxt, code) async {
    try {
      _isLoading = true;
      _checkedOutResponseModel = await runBusyFuture(
          repositoryImply.checkedOutCustomer(code),
          throwException: true);
      _isLoading = false;

      AppUtils.snackbar(contxt,
          message: _checkedOutResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> showBooking(contxt, code) async {
    try {
      _isLoading = true;
      _showBookingResponseModel = await runBusyFuture(
          repositoryImply.showBookings(code),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getOccupiedBookings(contxt) async {
    try {
      _isLoading = true;
      _getOccupiedBookingResponseModel = await runBusyFuture(
          repositoryImply.occupiedBookings(),
          throwException: true);

      // if (_getOccupiedBookingResponseModel!.occupiedBookings!.isNotEmpty) {
      _isLoading = false;

      // displayModalBottomSheet(contxt);
      // }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getBookings(contxt) async {
    try {
      _isLoading = true;
      _getAllBookingsResponseModel = await runBusyFuture(
          repositoryImply.allBookings(),
          throwException: true);

      // if (_getAllBookingsResponseModel!.bookings!.isNotEmpty) {
      _isLoading = false;

      // displayModalBottomSheet(contxt);
      // }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getCorporateCompanies(contxt) async {
    try {
      _isLoading = true;
      _corpCompanyModel = await runBusyFuture(
          repositoryImply.getCorporateAccount(),
          throwException: true);

      if (_corpCompanyModel?.success == true) {
        _isLoading = false;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> addBooking(
      {String? id, contxt, AddBookingEntityModel? entity}) async {
    try {
      _isLoading = true;
      _addBookingResponseModel = await runBusyFuture(
          repositoryImply.addBookings(id!, entity!),
          throwException: true);

      if (_addBookingResponseModel?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _addBookingResponseModel?.message!.toString());
        navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  showAlertDialog(BuildContext context, String code) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: TextView(
        text: "Cancel",
        color: AppColor.red,
        fontSize: 17.2.sp,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: TextView(
        text: "Yes",
        color: AppColor.green,
        fontSize: 17.2.sp,
      ),
      onPressed: () {
        deleteBooking(code, context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: TextView(
        text: "Alert Dialog",
        color: AppColor.black,
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
      ),
      content: TextView(
        text: "Would you like to delete this Reservation?",
        fontSize: 14.2,
        fontWeight: FontWeight.w400,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> updateBooking(
      {String? code, contxt, UpdateBookingEntityModel? updateEntity}) async {
    try {
      _isLoading = true;
      _updateBookingResponseModel = await runBusyFuture(
          repositoryImply.updateBookings(code!, updateEntity!),
          throwException: true);

      if (_updateBookingResponseModel?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _updateBookingResponseModel?.message!.toString());
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteBooking(String code, contxt) async {
    try {
      _isLoading = true;
      _deleteBookingResponseModel = await runBusyFuture(
          repositoryImply.deleteBooking(code),
          throwException: true);

      if (_deleteBookingResponseModel?.success == true) {
        _isLoading = false;
        getBookings(contxt);
        await AppUtils.snackbar(contxt,
            message: _deleteBookingResponseModel?.message!.toString());
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> paymentModel(contxt) async {
    try {
      _isLoading = true;
      _paymentModeResponseModel = await runBusyFuture(
          repositoryImply.paymentMode(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getIdCards(contxt) async {
    try {
      _isLoading = true;
      _cardReponseModel = await runBusyFuture(repositoryImply.getIdCards(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> findCustomer(contxt, String phone) async {
    try {
      _isLoading = true;
      _findCustomerResponsseModel = await runBusyFuture(
          repositoryImply.finfCustomer(phone),
          throwException: true);

      if (_findCustomerResponsseModel?.success == true) {
        _isLoading = false;
        _findCustomerData = _findCustomerResponsseModel!.data;
        AppUtils.snackbar(contxt,
            message: _findCustomerResponsseModel?.message!.toString());
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: 'Customer not found', error: true);
    }
    notifyListeners();
  }

  //////////////
  ///
  Future<void> getState(contxt) async {
    try {
      _isLoadingState = false;
      // ignore: unnecessary_null_comparison
      _stateModel =
          await runBusyFuture(repositoryImply.state(), throwException: true);

      _isLoadingState = false;
    } catch (e) {
      _isLoadingState = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getCities(context, id) async {
    try {
      _isLoadingCity = true;
      _cityModel =
          await runBusyFuture(repositoryImply.cities(id), throwException: true);
      _isLoadingCity = false;
    } catch (e) {
      _isLoadingCity = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Color statusColor(String roomsStatus) {
    if (roomsStatus.toLowerCase() == 'available') {
      return AppColor.grey;
    }
    if (roomsStatus.toLowerCase() == 'repair') {
      return AppColor.black;
    }
    if (roomsStatus.toLowerCase() == 'unpaid') {
      return AppColor.yellow;
    }
    if (roomsStatus.toLowerCase() == 'paid') {
      return AppColor.green;
    }
    if (roomsStatus.toLowerCase() == 'occupied') {
      return AppColor.red;
    }
    if (roomsStatus.toLowerCase() == 'dirty') {
      return AppColor.redBrown;
    }
    notifyListeners();
    return AppColor.primary;
  }

  Color statusColorText(String roomsStatus) {
    if (roomsStatus.toLowerCase() == 'available') {
      return AppColor.black;
    }
    if (roomsStatus.toLowerCase() == 'repair') {
      return AppColor.white;
    }
    if (roomsStatus.toLowerCase() == 'unpaid') {
      return AppColor.black;
    }
    if (roomsStatus.toLowerCase() == 'paid') {
      return AppColor.white;
    }
    if (roomsStatus.toLowerCase() == 'occupied') {
      return AppColor.white;
    }
    if (roomsStatus.toLowerCase() == 'dirty') {
      return AppColor.black;
    }

    notifyListeners();
    return AppColor.primary;
  }

  void displayModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColor.primary,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: .4,
              maxChildSize: .99,
              minChildSize: .32,
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
                        height: 10.h,
                      ),
                      Container(
                        width: 70.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextView(
                        text: 'Booking Histories',
                        fontSize: 22.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 14.2.h,
                      ),
                      Container(
                        color: AppColor.fadeddeepprimary.withOpacity(.4),
                        padding: EdgeInsets.all(8.w),
                        child: TextView(
                          text: '250 (Standard) ₦100,000.00',
                          fontSize: 16.8.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 22.2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Reservations',
                            fontSize: 17.2.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                          TextView(
                            text: 'View All',
                            fontSize: 13.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.2.h,
                      ),
                      if (getAllBookingsResponsemodel != null &&
                          getAllBookingsResponsemodel!.bookings!.isNotEmpty)
                        ...getAllBookingsResponsemodel!.bookings!
                            .map((o) => reversedContent(
                                  status: o.status,
                                  customer: o.customer,
                                  phone: o.phone,
                                  checkIn: o.checkedIn,
                                  checkOut: o.checkedOut,
                                  image: o.image,
                                ))
                    ],
                  ),
                ),
              ),
            ));
  }

  reversedContent({
    String? status,
    String? customer,
    String? phone,
    String? checkIn,
    String? checkOut,
    String? image,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120.w,
                child: TextView(
                  text: '$customer',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              TextView(
                text: phone ?? '',
                maxLines: 1,
                textOverflow: TextOverflow.clip,
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20.w,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 3.4.w, bottom: 3.4.w),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(22)),
                child: TextView(
                  text: 'Check In',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 13.2.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                text: checkOut ?? '',
                fontSize: 15.2.sp,
                color: AppColor.black,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 2.4.w, bottom: 2.4.w),
                decoration: BoxDecoration(
                    color: statusColor(status!),
                    borderRadius: BorderRadius.circular(22)),
                child: TextView(
                  text: status,
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 12.6.sp,
                  color: statusColorText(status),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 40.w,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 3.4.w, bottom: 3.4.w),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(22)),
                child: TextView(
                  text: 'Check Out',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 13.2.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                text: checkOut ?? '',
                fontSize: 15.2.sp,
                color: AppColor.black,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image ?? '',
                  fit: BoxFit.cover,
                  height: 52.h,
                  width: 70.w,
                ),
              ),
              SizedBox(
                height: 40.w,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 2.4.w, bottom: 2.4.w),
                decoration: BoxDecoration(
                    color: AppColor.deepprimary,
                    borderRadius: BorderRadius.circular(22)),
                child: TextView(
                  text: 'View',
                  maxLines: 1,
                  textOverflow: TextOverflow.clip,
                  fontSize: 13.2.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  printReceiptWidget() async {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                height: 4.h,
              ),
              pw.Column(
                // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    showBookingResponseModel?.data?.bookedItem ?? '',
                    style: pw.TextStyle(
                      fontSize: 28.2.sp,
                    ),
                  ),
                  pw.SizedBox(
                    height: 8.h,
                  ),
                  pw.Text(
                    'NGN${oCcy.format(showBookingResponseModel?.data?.price ?? 0)}',
                    style: pw.TextStyle(
                        fontSize: 32.2.sp, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10.h,
              ),
              pw.Container(
                width: double.infinity,
                padding:
                    pw.EdgeInsets.symmetric(vertical: 15.2.w, horizontal: 20.w),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Column(
                  children: [
                    pw.Text(
                      showBookingResponseModel?.data?.customer ?? '',
                      style: pw.TextStyle(
                        fontSize: 34.12.sp,
                      ),
                    ),
                    pw.SizedBox(
                      height: 5.0.h,
                    ),
                    pw.Text(
                      showBookingResponseModel?.data?.phone ?? '',
                      style: pw.TextStyle(
                        fontSize: 25.2.sp,
                      ),
                    ),
                    pw.SizedBox(
                      height: 5.0.h,
                    ),
                    pw.Text(
                      showBookingResponseModel?.data?.email ?? '',
                      style: pw.TextStyle(
                        fontSize: 25.2.sp,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 10.h,
              ),
              pw.Container(
                width: double.infinity,
                padding:
                    pw.EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Column(
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Checked-In',
                          style: pw.TextStyle(
                            fontSize: 25.2.sp,
                          ),
                        ),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                          showBookingResponseModel?.data?.checkedIn ?? '',
                          style: pw.TextStyle(
                            fontSize: 25.2.sp,
                          ),
                        )
                      ],
                    ),
                    pw.SizedBox(
                      height: 10.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Checked-Out',
                          style: pw.TextStyle(fontSize: 25.2.sp),
                        ),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                            showBookingResponseModel?.data?.checkedOut ?? '',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 10.h,
              ),
              pw.Container(
                width: double.infinity,
                padding:
                    pw.EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Column(
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Discount(%)',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                            showBookingResponseModel?.data?.discount
                                    .toString() ??
                                '',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                      ],
                    ),
                    pw.SizedBox(
                      height: 10.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Total Due',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                            'NGN${oCcy.format(showBookingResponseModel?.data?.due ?? 0)}',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                      ],
                    ),
                    pw.SizedBox(
                      height: 10.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Total Amount paid',
                            style: pw.TextStyle(
                              fontSize: 25.2.sp,
                            )),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                            'NGN${oCcy.format(showBookingResponseModel?.data?.amountPaid ?? 0)}',
                            style: pw.TextStyle(fontSize: 25.2.sp)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
    printerCall();
  }

  void printerCall() async {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
