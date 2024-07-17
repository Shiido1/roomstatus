import 'package:roomstatus/core/connect_end/contract/booking_contract_impl.dart';
import 'package:roomstatus/core/connect_end/model/add_booking_response_model/add_booking_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_dues_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/update_booking_response_model/update_booking_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/add_booking_entity_model.dart';
import '../model/check_in_response_model/check_in_response_model.dart';
import '../model/checked_out_response_model/checked_out_response_model.dart';
import '../model/delete_booking_response_model/delete_booking_response_model.dart';
import '../model/find_customer_responsse_model/find_customer_responsse_model.dart';
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

@lazySingleton
class BookingRepoImpl {
  final _contract = locator<BookingContractImpl>();

  Future<FindCustomerResponsseModel> finfCustomer(String phone) async {
    final response = await _contract.findCustomer(phone);
    return response;
  }

  Future<GetCorpCompanyModel> getCorporateAccount() async {
    final response = await _contract.getCorporateAccount();
    return response;
  }

  Future<ShowBookingResponseModel> showBookings(String bookingCode) async {
    final response = await _contract.showBookings(bookingCode);
    return response;
  }

  Future<UpdateBookingResponseModel> updateBookings(
      String bookingCode, UpdateBookingEntityModel updateBooking) async {
    final response = await _contract.updateBookings(bookingCode, updateBooking);
    return response;
  }

  Future<DeleteBookingResponseModel> deleteBooking(String bookingCode) async {
    final response = await _contract.deleteBooking(bookingCode);
    return response;
  }

  Future<CheckInResponseModel> checkedInCustomer(String bookingCode) async {
    final response = await _contract.checkedInCustomer(bookingCode);
    return response;
  }

  Future<CheckedOutResponseModel> checkedOutCustomer(String bookingCode) async {
    final response = await _contract.checkedOutCustomer(bookingCode);
    return response;
  }

  Future<GetOccupiedBookingsResponseModelList> occupiedBookings() async {
    final response = await _contract.occupiedBooking();
    return response;
  }

  Future<AddBookingResponseModel> addBookings(
      String id, AddBookingEntityModel addBooking) async {
    final response = await _contract.addBookings(id, addBooking);
    return response;
  }

  Future<GetAllBookingsResponseModel> allBookings() async {
    final response = await _contract.getBookings();
    return response;
  }

  Future<PaymentModeResponseModel> paymentMode() async {
    final response = await _contract.paymentMode();
    return response;
  }

  Future<IdCardReponseModel> getIdCards() async {
    final response = await _contract.getIdCards();
    return response;
  }

  Future<dynamic> hallBooking() async {
    final response = await _contract.allHallBookings();
    return response;
  }

  Future<dynamic> roomBooking() async {
    final response = await _contract.allRoomBookings();
    return response;
  }

  Future<GetDueResponseModel> getDues(GetDuesEntityModel entity) async {
    final response = await _contract.getDues(entity);
    return response;
  }

  ////////
  ///

  Future<GetCitiesResponseModel> cities(String? cities) async {
    final response = await _contract.cities(cities);
    return response;
  }

  Future<GetStateResponseModel> state() async {
    final response = await _contract.state();
    return response;
  }
}
