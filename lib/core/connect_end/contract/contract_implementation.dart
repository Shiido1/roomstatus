import 'package:roomstatus/core/connect_end/model/delete_account_response_model/delete_account_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_all_rooms_response_model/get_all_rooms_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_cities_response_model/get_cities_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_country_model/get_country_model.dart';
import 'package:roomstatus/core/connect_end/model/get_profile_response_model/get_profile_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_room_response_model/get_room_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_state_response_model/get_state_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_status_response_model/get_status_response_model.dart';
import 'package:roomstatus/core/connect_end/model/login_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:roomstatus/core/connect_end/model/otp_entity_model.dart';
import 'package:roomstatus/core/connect_end/model/otp_response_model/otp_response_model.dart';
import 'package:roomstatus/core/connect_end/model/recent_otp_response_model/recent_otp_response_model.dart';
import 'package:roomstatus/core/connect_end/model/resent_otp_entity_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/registration_entity_model.dart';
import '../model/registration_response_model/registration_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<RegistrationResponseModel> register(
          RegistrationEntityModel registrationRequestEntity) async =>
      await _api.register(registrationRequestEntity);

  Future<GetCountryModel> country({String? country, String? page}) async =>
      await _api.country(country: country, page: page);

  Future<GetCitiesResponseModel> cities({String? cities, String? page}) async =>
      await _api.city(city: cities, page: page);

  Future<GetStateResponseModel> state({String? state, String? page}) async =>
      await _api.state(state: state, page: page);

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async =>
      await _api.login(loginEntityModel);

  Future<OtpResponseModel> otp(OtpEntityModel otpEntityModel) async =>
      await _api.otp(otpEntityModel);

  Future<GetProfileResponseModel> profile() async => await _api.getProfile();

  Future<RecentOtpResponseModel> resendOtp(
          ResentOtpEntityModel resendOtpEntityModel) async =>
      await _api.resendOtp(resendOtpEntityModel);

  Future<GetRoomResponseModel> room(String? date, String? id) async =>
      await _api.room(date: date, id: id);

  Future<GetAllRoomsResponseModel> rooms(String? date) async =>
      await _api.rooms(date!);

  Future<GetStatusResponseModel> status(String? date) async =>
      await _api.status(date!);

  Future<DeleteAccountResponseModel> deleteAccount() async =>
      await _api.deleteAccouunt();

  Future<dynamic> roomBooking(String? id) async => await _api.roomBookings(id!);
}
