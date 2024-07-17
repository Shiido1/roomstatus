import 'package:roomstatus/core/api_folder/booking_api.dart';
import 'package:roomstatus/core/connect_end/model/add_booking_response_model/add_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/find_customer_responsse_model/find_customer_responsse_model.dart';
import 'package:roomstatus/core/connect_end/model/get_dues_entity_model.dart';
import 'package:roomstatus/core/core_folder/app/app.locator.dart';

import '../model/add_booking_entity_model.dart';
import '../model/check_in_response_model/check_in_response_model.dart';
import '../model/checked_out_response_model/checked_out_response_model.dart';
import '../model/delete_booking_response_model/delete_booking_response_model.dart';
import '../model/get_all_bookings_response_model/get_all_bookings_response_model.dart';
import '../model/get_cities_response_model/get_cities_response_model.dart';
import '../model/get_corp_company_model/get_corp_company_model.dart';
import '../model/get_due_response_model/get_due_response_model.dart';
import '../model/get_occupied_bookings_response_model/get_occupied_bookings_response_model.dart';
import '../model/get_state_response_model/get_state_response_model.dart';
import '../model/id_card_reponse_model/id_card_reponse_model.dart';
import '../model/payment_mode_response_model/payment_mode_response_model.dart';
import '../model/show_booking_response_model/show_booking_response_model.dart';
import '../model/update_booking_entity_model.dart';
import '../model/update_booking_response_model/update_booking_response_model.dart';

class BookingContractImpl {
  final _api = locator<BookingApi>();

  Future<FindCustomerResponsseModel> findCustomer(String phone) async =>
      await _api.findCustomer(phone);
  Future<GetCorpCompanyModel> getCorporateAccount() async =>
      await _api.getCorporateAccount();
  Future<ShowBookingResponseModel> showBookings(String bookingCode) async =>
      await _api.showBookings(bookingCode);
  Future<UpdateBookingResponseModel> updateBookings(
          String bookingCode, UpdateBookingEntityModel updateBooking) async =>
      await _api.updateBooking(bookingCode, updateBooking);
  Future<DeleteBookingResponseModel> deleteBooking(String bookingCode) async =>
      await _api.deleteBooking(bookingCode);
  Future<CheckInResponseModel> checkedInCustomer(String bookingCode) async =>
      await _api.checkedInCustomer(bookingCode);
  Future<CheckedOutResponseModel> checkedOutCustomer(
          String bookingCode) async =>
      await _api.checkedOutCustomer(bookingCode);
  Future<GetOccupiedBookingsResponseModelList> occupiedBooking() async =>
      await _api.occupiedBookings();
  Future<AddBookingResponseModel> addBookings(
          String id, AddBookingEntityModel addBooking) async =>
      await _api.addBooking(id, addBooking);
  Future<GetAllBookingsResponseModel> getBookings() async =>
      await _api.allBookings();
  Future<PaymentModeResponseModel> paymentMode() async =>
      await _api.getPaymentMode();
  Future<IdCardReponseModel> getIdCards() async => await _api.getIdCards();
  Future<dynamic> allHallBookings() async => await _api.allHallBookings();
  Future<dynamic> allRoomBookings() async => await _api.allRoomBookings();
  Future<GetDueResponseModel> getDues(GetDuesEntityModel entity) async =>
      await _api.getDues(entity);
  //////
  ///
  Future<GetCitiesResponseModel> cities(String? cities) async =>
      await _api.city(cities);

  Future<GetStateResponseModel> state() async => await _api.state();
}
