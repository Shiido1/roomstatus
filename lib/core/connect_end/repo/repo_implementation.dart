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
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preferance.dart';
import '../contract/contract_implementation.dart';
import '../model/registration_entity_model.dart';
import '../model/registration_response_model/registration_response_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<RegistrationResponseModel> register(
      RegistrationEntityModel registrationRequestEntity) async {
    final response = await _contract.register(registrationRequestEntity);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }

  Future<GetCountryModel> country({String? country, String? page}) async {
    final response = await _contract.country(country: country, page: page);
    return response;
  }

  Future<GetCitiesResponseModel> cities({String? cities, String? page}) async {
    final response = await _contract.cities(cities: cities, page: page);
    return response;
  }

  Future<GetStateResponseModel> state({String? state, String? page}) async {
    final response = await _contract.state(state: state, page: page);
    return response;
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async {
    final response = await _contract.login(loginEntityModel);
    return response;
  }

  Future<OtpResponseModel> otp(OtpEntityModel otpEntityModel) async {
    final response = await _contract.otp(otpEntityModel);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

  Future<GetProfileResponseModel> profile() async {
    final response = await _contract.profile();
    return response;
  }

  Future<RecentOtpResponseModel> resendOtp(
      ResentOtpEntityModel resendOtpEntityModel) async {
    final response = await _contract.resendOtp(resendOtpEntityModel);
    return response;
  }

  Future<GetRoomResponseModel> room(String? date, String id) async {
    final response = await _contract.room(date, id);
    return response;
  }

  Future<GetAllRoomsResponseModel> rooms(String? date) async {
    final response = await _contract.rooms(date);
    return response;
  }

  Future<GetStatusResponseModel> status(String? date) async {
    final response = await _contract.status(date);
    return response;
  }
}
