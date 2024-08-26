import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/guest_list_response_model/guest_list_response_model.dart';
import 'package:roomstatus/core/connect_end/model/make_payment_response_model/make_payment_response_model.dart';
import 'package:roomstatus/core/connect_end/model/notify_corporate_response_model/notify_corporate_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_history_response_model/payment_history_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payroll_response_model/payroll_response_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_repsonse_model/profit_and_loss_repsonse_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_response_model/report_room_response_model.dart';
import 'package:roomstatus/core/connect_end/model/report_sales_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_sales_response_model/report_sales_response_model.dart';
import 'package:roomstatus/core/connect_end/repo/report_repo_impl.dart';
import 'package:roomstatus/core/core_folder/app/app.router.dart';
import 'package:roomstatus/main.dart';
import 'package:roomstatus/ui/screens/dashboard/report/payment/guest_list/guest_list_display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/screens/dashboard/report/payment/profit_and_loss/profit_and_loss_display_screen.dart';
import '../../../ui/widgets/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/get_all_booking_history/get_all_booking_history.dart';
import '../model/get_all_items_response_model/datum.dart';
import '../model/get_all_items_response_model/get_all_items_response_model.dart';
import '../model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import '../model/get_corp_company_model/get_corp_company_model.dart';
import '../model/guest_list_response_model/datum.dart' as guest;

class ReportViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('ReportViewModel');

  final repositoryImply = ReportRepoImpl();
  bool? _isLoading;
  bool? get isLoading => _isLoading;

  ReportRoomResponseModel? _reportRoomResponseModel;
  ReportRoomResponseModel? get reportRoomResponseModel =>
      _reportRoomResponseModel;
  ReportSalesResponseModel? _reportSalesResponseModel;
  ReportSalesResponseModel? get reportSalesresponseModel =>
      _reportSalesResponseModel;

  MakePaymentResponseModel? _paymentResponseModel;
  MakePaymentResponseModel? get paymentResponseModel => _paymentResponseModel;

  PaymentHistoryResponseModel? _payHistoryResponseModel;
  PaymentHistoryResponseModel? get payHistoryResponseModel =>
      _payHistoryResponseModel;

  GetAllRoomsResponseModel? _allRoomsResponseModel;
  GetAllRoomsResponseModel? get allRoomsResponseModel => _allRoomsResponseModel;

  GetAllItemsResponseModel? _getAllItemsResponseModel;
  GetAllItemsResponseModel? get getAllItemsResponseModel =>
      _getAllItemsResponseModel;

  List<Datum>? _getAllItemsResponseModelListCopy=[];
  List<Datum>? _getAllItemsResponseModelList =[];
  List<Datum>? get getAllItemsResponseModelList =>
      _getAllItemsResponseModelList;

  PayrollResponseModel? _payrollResponseModel;
  PayrollResponseModel? get payrollResponseModel => _payrollResponseModel;
  GuestListResponseModel? _guestListResponseModel;
  GuestListResponseModel? get guestListResponseModel => _guestListResponseModel;
  ProfitAndLossRepsonseModel? _profitAndLossRepsonseModel;
  ProfitAndLossRepsonseModel? get profitAndLossRepsonseModel =>
      _profitAndLossRepsonseModel;
  List<guest.Datum>? _guestListResponseModelListCopy;
  List<guest.Datum>? _guestListResponseModelList;
  List<guest.Datum>? get guestListResponseModelList =>
      _guestListResponseModelList;
  GetCorpCompanyModel? _getCorpCompanyModel;
  GetCorpCompanyModel? get getCorporateModel => _getCorpCompanyModel;
  GetAllBookingHistory? _allBookingsResponseModel;
  GetAllBookingHistory? get allBookingResponseModel =>
      _allBookingsResponseModel;
  NotifyCorporateResponseModel? _corporateNotifyResponseModel;
  NotifyCorporateResponseModel? get corporateNotifyResponseModel =>
      _corporateNotifyResponseModel;

  int page = 1;
  bool isLoadNoMore = false;

  ReportViewModel({this.context});

  List<String> revenue = [
    'Revenue from Room',
    // 'Revenue from Hall',
    'Revenue from Sales',
    'Corporate / Collection Accounts'
  ];
  List<String> revenue1 = [];

  void displayBookingModalBottomSheet(
      {BuildContext? context, String? id, String? name, String? amount}) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 243, 139, 132),
        context: context!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        builder: (context) => ViewModelBuilder<ReportViewModel>.reactive(
            viewModelBuilder: () => locator<ReportViewModel>(),
            onViewModelReady: (model) {},
            disposeViewModel: false,
            builder: (_, ReportViewModel model, __) {
              return DraggableScrollableSheet(
                expand: false,
                initialChildSize: .3,
                maxChildSize: .39,
                minChildSize: .22,
                builder:
                    (BuildContext context, ScrollController scrollController) =>
                        SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                          height: 17.2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (amount == 'null') {
                                  AppUtils.snackbar(context,
                                      message: 'Customer is no owing..!');
                                } else {
                                  navigate.navigateTo(
                                      Routes.reportPaymentScreen,
                                      arguments: ReportPaymentScreenArguments(
                                          name: name, amount: amount, id: id));
                                }
                              },
                              child: TextView(
                                text: 'Update Payment',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Divider(
                              color: AppColor.white,
                              thickness: .4.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            GestureDetector(
                              onTap: () => navigate.navigateTo(
                                  Routes.paymentHistoryScreen,
                                  arguments: PaymentHistoryScreenArguments(
                                    id: id,
                                  )),
                              child: TextView(
                                text: 'Payment History',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Divider(
                              color: AppColor.white,
                              thickness: .4.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            GestureDetector(
                              onTap: () => navigate.navigateTo(
                                  Routes.bookingHistoryScreen,
                                  arguments: BookingHistoryScreenArguments(
                                      id: id, name: name)),
                              child: TextView(
                                text: 'View History',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Future<void> reportRoom(contxt, ReportRoomEntityModel reportRoom) async {
    try {
      _isLoading = true;
      _reportRoomResponseModel = await runBusyFuture(
          repositoryImply.reportRoom(reportRoom),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _reportRoomResponseModel?.message ?? '');
      navigate.navigateTo(Routes.reportRoomScreen);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> corporateNotifyAccount(contxt, String id) async {
    try {
      _isLoading = true;
      _corporateNotifyResponseModel = await runBusyFuture(
          repositoryImply.corporateReminder(id),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _corporateNotifyResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> corporateAccount(contxt) async {
    try {
      _isLoading = true;
      _getCorpCompanyModel = await runBusyFuture(
          repositoryImply.getCorporateAccount(),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _getCorpCompanyModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllRooms(BuildContext context, {String? date}) async {
    try {
      _isLoading = true;
      // _isStatusTapped = false;
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

  Future<void> getItems(contxt) async {
    try {
      _isLoading = true;
      _getAllItemsResponseModel = await runBusyFuture(
          repositoryImply.getAllItems(page: page.toString()),
          throwException: true);
      _getAllItemsResponseModelList = _getAllItemsResponseModel!.data!;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_getAllItemsResponseModel!.data!.length <
        _getAllItemsResponseModel!.meta!.total!) {
      page++;
      try {
        _getAllItemsResponseModel = await runBusyFuture(
            repositoryImply.getAllItems(page: page.toString()));
        _getAllItemsResponseModelListCopy!
            .addAll(_getAllItemsResponseModel!.data!);
        _getAllItemsResponseModelList!
            .addAll(_getAllItemsResponseModelListCopy!);
        _getAllItemsResponseModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    notifyListeners();
  }

  Future<void> reportSales(contxt, ReportSalesEntityModel reportSales) async {
    try {
      _isLoading = true;
      _reportSalesResponseModel = await runBusyFuture(
          repositoryImply.reportSales(reportSales),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _reportSalesResponseModel?.message ?? '');

      navigate.navigateTo(Routes.reportSalesScreen);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> makePay(contxt, PaymentEntityModel payment, String id) async {
    try {
      _isLoading = true;
      _paymentResponseModel = await runBusyFuture(
          repositoryImply.makePayment(payment, id),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt, message: _paymentResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> paymentHistory(contxt, String id) async {
    try {
      _isLoading = true;
      _payHistoryResponseModel = await runBusyFuture(
          repositoryImply.paymentHistory(id),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt,
          message: _payHistoryResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> allBookingHistory(contxt, String id) async {
    try {
      _isLoading = true;
      _allBookingsResponseModel = await runBusyFuture(
          repositoryImply.bookingHistory(id),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt,
          message: _allBookingsResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> payroll(contxt) async {
    try {
      _isLoading = true;
      _payrollResponseModel =
          await runBusyFuture(repositoryImply.payroll(), throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt, message: _payrollResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> profitAndLoss(contxt, ProfitAndLossEntityModel entity) async {
    try {
      _isLoading = true;
      _profitAndLossRepsonseModel = await runBusyFuture(
          repositoryImply.profitAndLoss(entity),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _profitAndLossRepsonseModel?.message ?? '');
      Get.to(
          () => ProfitAndLossDisplayScreen(
                data: _profitAndLossRepsonseModel!.data,
              ),
          transition: Transition.native,
          duration: const Duration(seconds: 1));
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  int pageGuest = 1;
  bool isLoadNoMoreGuest = false;

  Future<void> guestlist(contxt, GuestListEntityModel entity) async {
    try {
      _isLoading = true;
      _guestListResponseModel = await runBusyFuture(
          repositoryImply.guestList(entity),
          throwException: true);
      _guestListResponseModelList = _guestListResponseModel!.data;
      _isLoading = false;
      Get.to(
          () => GuestListDisplayScreen(
                entity: entity,
              ),
          transition: Transition.native,
          duration: const Duration(seconds: 1));
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshGuest() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingGuest(GuestListEntityModel entity) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_guestListResponseModel!.data!.length <
        _guestListResponseModel!.meta!.total!) {
      pageGuest++;
      try {
        _guestListResponseModel =
            await runBusyFuture(repositoryImply.guestList(entity));
        _guestListResponseModelListCopy!.addAll(_guestListResponseModel!.data!);
        _guestListResponseModelList!.addAll(_guestListResponseModelListCopy!);
        _guestListResponseModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreGuest = true;
      null;
    }
    notifyListeners();
  }
}
