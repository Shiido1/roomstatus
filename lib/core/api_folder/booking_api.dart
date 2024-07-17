import 'package:roomstatus/core/connect_end/model/add_booking_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/add_booking_response_model/add_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/checked_out_response_model/checked_out_response_model.dart';
import 'package:roomstatus/core/connect_end/model/delete_booking_response_model/delete_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/find_customer_responsse_model/find_customer_responsse_model.dart';
import 'package:roomstatus/core/connect_end/model/get_all_bookings_response_model/get_all_bookings_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_corp_company_model/get_corp_company_model.dart';
import 'package:roomstatus/core/connect_end/model/get_due_response_model/get_due_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_dues_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/get_occupied_bookings_response_model/get_occupied_bookings_response_model.dart';
import 'package:roomstatus/core/connect_end/model/id_card_reponse_model/id_card_reponse_model.dart';
import 'package:roomstatus/core/connect_end/model/payment_mode_response_model/payment_mode_response_model.dart';
import 'package:roomstatus/core/connect_end/model/show_booking_response_model/show_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/update_booking_entity_model.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/check_in_response_model/check_in_response_model.dart';
import '../connect_end/model/get_cities_response_model/get_cities_response_model.dart';
import '../connect_end/model/get_state_response_model/get_state_response_model.dart';
import '../connect_end/model/update_booking_response_model/update_booking_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class BookingApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('BookingViewModel');

  //find your customers

  Future<FindCustomerResponsseModel> findCustomer(String phone) async {
    try {
      final response = await _service.call(
          UrlConfig.find_customer, RequestMethod.post,
          data: {"phone": phone});
      logger.d(response.data);
      return FindCustomerResponsseModel.fromJson(response.data);
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

  //get show booking

  Future<ShowBookingResponseModel> showBookings(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_bookings}/$bookingCode',
        RequestMethod.get,
      );
      logger.d(response.data);
      return ShowBookingResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  //get update booking

  Future<UpdateBookingResponseModel> updateBooking(
      String bookingCode, UpdateBookingEntityModel updateBooking) async {
    try {
      final response = await _service.call(
          '${UrlConfig.get_bookings}/$bookingCode/update', RequestMethod.put,
          data: updateBooking.toJson());
      logger.d(response.data);
      return UpdateBookingResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddBookingResponseModel> addBooking(
      String id, AddBookingEntityModel addBooking) async {
    try {
      final response = await _service.call(
          '${UrlConfig.add_bookings}/$id/add', RequestMethod.post,
          data: addBooking.toJson());
      logger.d(response.data);
      return AddBookingResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  // delete booking

  Future<DeleteBookingResponseModel> deleteBooking(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_bookings}/$bookingCode',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return DeleteBookingResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // check in customers booking

  Future<CheckInResponseModel> checkedInCustomer(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_bookings}/$bookingCode/checked-in',
        RequestMethod.post,
      );
      logger.d(response.data);
      return CheckInResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // check out customers booking

  Future<CheckedOutResponseModel> checkedOutCustomer(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_bookings}/$bookingCode/checked-out',
        RequestMethod.post,
      );
      logger.d(response.data);
      return CheckedOutResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // get occupied booking

  Future<GetOccupiedBookingsResponseModelList> occupiedBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.get_occupied_bookings,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetOccupiedBookingsResponseModelList.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get all hall booking

  Future<dynamic> allHallBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.all_booking_hall,
        RequestMethod.get,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //get all room booking

  Future<dynamic> allRoomBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.all_booking_room,
        RequestMethod.get,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //get all booking

  Future<GetAllBookingsResponseModel> allBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.get_bookings,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllBookingsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get payment mode

  Future<PaymentModeResponseModel> getPaymentMode() async {
    try {
      final response = await _service.call(
        UrlConfig.get_payment_mode,
        RequestMethod.get,
      );
      logger.d(response.data);
      return PaymentModeResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get id cards
  Future<IdCardReponseModel> getIdCards() async {
    try {
      final response = await _service.call(
        UrlConfig.get_ids,
        RequestMethod.get,
      );
      logger.d(response.data);
      return IdCardReponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  /////////
  ///
  Future<GetStateResponseModel> state() async {
    try {
      final response = await _service.call(UrlConfig.state, RequestMethod.get);
      logger.d(response.data);
      return GetStateResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetCitiesResponseModel> city(
    String? city,
  ) async {
    try {
      final response =
          await _service.call(UrlConfig.city, RequestMethod.get, data: {
        "state": city,
      });
      logger.d(response.data);
      return GetCitiesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetDueResponseModel> getDues(GetDuesEntityModel entity) async {
    try {
      final response = await _service
          .call(UrlConfig.get_due, RequestMethod.post, data: entity.toJson());
      logger.d(response.data);
      return GetDueResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
