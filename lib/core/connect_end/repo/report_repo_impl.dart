import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/guest_list_response_model/guest_list_response_model.dart';
import 'package:roomstatus/core/connect_end/model/make_payment_response_model/make_payment_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_history_response_model/payment_history_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payroll_response_model/payroll_response_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_repsonse_model/profit_and_loss_repsonse_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_response_model/report_room_response_model.dart';
import 'package:roomstatus/core/connect_end/model/report_sales_entity_model.dart';
import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../contract/report_contract_impl.dart';
import '../model/get_all_booking_history/get_all_booking_history.dart';
import '../model/get_all_items_response_model/get_all_items_response_model.dart';
import '../model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import '../model/get_corp_company_model/get_corp_company_model.dart';
import '../model/notify_corporate_response_model/notify_corporate_response_model.dart';
import '../model/report_hall_entity_model.dart';
import '../model/report_sales_response_model/report_sales_response_model.dart';

@lazySingleton
class ReportRepoImpl {
  final _contract = locator<ReportContractImpl>();

  Future<ReportRoomResponseModel> reportRoom(
      ReportRoomEntityModel entity) async {
    final response = await _contract.reportRooms(entity);
    return response;
  }

  Future<dynamic> reportHall(ReportHallEntityModel entity) async {
    final response = await _contract.reportHall(entity);
    return response;
  }

  Future<ReportSalesResponseModel> reportSales(
      ReportSalesEntityModel entity) async {
    final response = await _contract.reportSales(entity);
    return response;
  }

  Future<NotifyCorporateResponseModel> corporateReminder(String id) async {
    final response = await _contract.corporateReminder(id);
    return response;
  }

  Future<MakePaymentResponseModel> makePayment(
      PaymentEntityModel entity, String id) async {
    final response = await _contract.makePayment(entity, id);
    return response;
  }

  Future<GetAllBookingHistory> bookingHistory(String id) async {
    final response = await _contract.bookingHistory(id);
    return response;
  }

  Future<PaymentHistoryResponseModel> paymentHistory(String id) async {
    final response = await _contract.paymentHistory(id);
    return response;
  }

  Future<GetCorpCompanyModel> getCorporateAccount() async {
    final response = await _contract.getCorporateAccount();
    return response;
  }

  Future<GetAllRoomsResponseModel> rooms(String? date) async {
    final response = await _contract.rooms(date);
    return response;
  }

  Future<GetAllItemsResponseModel> getAllItems({String? page}) async {
    final response = await _contract.allItems(page: page);
    return response;
  }

  Future<PayrollResponseModel> payroll() async {
    final response = await _contract.payroll();
    return response;
  }

  Future<ProfitAndLossRepsonseModel> profitAndLoss(
      ProfitAndLossEntityModel entity) async {
    final response = await _contract.profitAndLoss(entity);
    return response;
  }

  Future<GuestListResponseModel> guestList(GuestListEntityModel entity,
      {String? id}) async {
    final response = await _contract.guestList(entity);
    return response;
  }
}
