import 'package:roomstatus/core/connect_end/model/guest_list_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/guest_list_response_model/guest_list_response_model.dart';
import 'package:roomstatus/core/connect_end/model/notify_corporate_response_model/notify_corporate_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_history_response_model/payment_history_response_model.dart';
import 'package:roomstatus/core/connect_end/model/payroll_response_model/payroll_response_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/profit_and_loss_repsonse_model/profit_and_loss_repsonse_model.dart';
import 'package:roomstatus/core/connect_end/model/report_hall_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/report_room_response_model/report_room_response_model.dart';
import 'package:roomstatus/core/connect_end/model/report_sales_response_model/report_sales_response_model.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/get_all_booking_history/get_all_booking_history.dart';
import '../connect_end/model/get_all_items_response_model/get_all_items_response_model.dart';
import '../connect_end/model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import '../connect_end/model/get_corp_company_model/get_corp_company_model.dart';
import '../connect_end/model/make_payment_response_model/make_payment_response_model.dart';
import '../connect_end/model/report_sales_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class ReportApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('ReportViewModel');

  //get all rooms report

  Future<ReportRoomResponseModel> reportRooms(
      ReportRoomEntityModel roomEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.report_from_room, RequestMethod.post,
          data: roomEntity.toJson());
      logger.d(response.data);
      return ReportRoomResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  //get all rooms report

  Future<dynamic> reporthalls(ReportHallEntityModel hallEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.report_from_hall, RequestMethod.post,
          data: hallEntity.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
  //get all sales report

  Future<ReportSalesResponseModel> reportSales(
      ReportSalesEntityModel entity) async {
    try {
      final response = await _service.call(
          UrlConfig.sales_report, RequestMethod.post,
          data: entity.toJson());
      logger.d(response.data);
      return ReportSalesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NotifyCorporateResponseModel> corporateReminder(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.corporate_reminder}/$id/notify',
        RequestMethod.get,
      );
      logger.d(response.data);
      return NotifyCorporateResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //make payment

  Future<MakePaymentResponseModel> makePayment(
      PaymentEntityModel payment, String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.make_payment}/$id/payment', RequestMethod.post,
          data: payment.toJson());
      logger.d(response.data);
      return MakePaymentResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all booking history

  Future<GetAllBookingHistory> bookingHistory(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.booking_history}/$id/booking-histories',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllBookingHistory.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  //get all payment history

  Future<PaymentHistoryResponseModel> paymentHistory(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.booking_history}/$id/payment-histories',
        RequestMethod.post,
      );
      logger.d(response.data);
      return PaymentHistoryResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get corporate account

  Future<GetCorpCompanyModel> getCorporateAccount() async {
    try {
      final response = await _service.call(
        UrlConfig.booking_companies,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetCorpCompanyModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetAllRoomsResponseModel> rooms(String date) async {
    try {
      final response = await _service.call(
          UrlConfig.get_all_rooms, RequestMethod.get,
          data: {"date": date});
      logger.d(response.data);
      return GetAllRoomsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all items
  Future<GetAllItemsResponseModel> getAllItems({String? page}) async {
    try {
      final response = await _service.call(
          UrlConfig.get_all_items, RequestMethod.get,
          data: {"page": page});
      logger.d(response.data);
      return GetAllItemsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all items
  Future<ProfitAndLossRepsonseModel> profitAndLoss(
      {ProfitAndLossEntityModel? entity}) async {
    try {
      final response = await _service.call(
          UrlConfig.profit_and_loss, RequestMethod.post,
          data: entity!.toJson());
      logger.d(response.data);
      return ProfitAndLossRepsonseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all items
  Future<GuestListResponseModel> guestList(
      {GuestListEntityModel? entity, String? page}) async {
    try {
      final response = await _service.call(
          UrlConfig.guest_list, RequestMethod.post,
          queryParams: {"page": page}, data: entity!.toJson());
      logger.d(response.data);
      return GuestListResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all items
  Future<PayrollResponseModel> payroll() async {
    try {
      final response = await _service.call(
        UrlConfig.payroll,
        RequestMethod.get,
      );
      logger.d(response.data);
      return PayrollResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
