import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/guest_list_response_model/guest_list_response_model.dart';
import 'package:roomstatus/core/connect_end/model/make_payment_response_model/make_payment_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_repsonse_model/profit_and_loss_repsonse_model.dart';
import 'package:roomstatus/core/connect_end/model/report_hall_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_response_model/report_room_response_model.dart';

import '../../api_folder/report_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_all_booking_history/get_all_booking_history.dart';
import '../model/get_all_items_response_model/get_all_items_response_model.dart';
import '../model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import '../model/get_corp_company_model/get_corp_company_model.dart';
import '../model/notify_corporate_response_model/notify_corporate_response_model.dart';
import '../model/payment_history_response_model/payment_history_response_model.dart';
import '../model/payroll_response_model/payroll_response_model.dart';
import '../model/report_sales_entity_model.dart';
import '../model/report_sales_response_model/report_sales_response_model.dart';

class ReportContractImpl {
  final _api = locator<ReportApi>();

  Future<ReportRoomResponseModel> reportRooms(
          ReportRoomEntityModel reportEntity) async =>
      await _api.reportRooms(reportEntity);
  Future<dynamic> reportHall(ReportHallEntityModel reportEntity) async =>
      await _api.reporthalls(reportEntity);
  Future<ReportSalesResponseModel> reportSales(
          ReportSalesEntityModel entity) async =>
      await _api.reportSales(entity);
  Future<NotifyCorporateResponseModel> corporateReminder(String id) async =>
      await _api.corporateReminder(id);
  Future<GetCorpCompanyModel> getCorporateAccount() async =>
      await _api.getCorporateAccount();

  Future<GetAllItemsResponseModel> allItems({String? page}) async =>
      await _api.getAllItems(page: page);
  Future<GetAllRoomsResponseModel> rooms(String? date) async =>
      await _api.rooms(date!);
  Future<MakePaymentResponseModel> makePayment(
          PaymentEntityModel paymentEntity, String id) async =>
      await _api.makePayment(paymentEntity, id);
  Future<GetAllBookingHistory> bookingHistory(String id) async =>
      await _api.bookingHistory(id);
  Future<PaymentHistoryResponseModel> paymentHistory(String id) async =>
      await _api.paymentHistory(id);
  Future<PayrollResponseModel> payroll() async => await _api.payroll();
  Future<ProfitAndLossRepsonseModel> profitAndLoss(
          ProfitAndLossEntityModel entity) async =>
      await _api.profitAndLoss(entity: entity);
  Future<GuestListResponseModel> guestList(GuestListEntityModel entity,
          {String? id}) async =>
      await _api.guestList(
        entity: entity,
      );
}
