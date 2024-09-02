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
import 'package:roomstatus/core/core_folder/network/network_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/registration_entity_model.dart';
import '../connect_end/model/registration_response_model/registration_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<RegistrationResponseModel> register(
      RegistrationEntityModel signUpEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.register, RequestMethod.upload,
          data: FormData.fromMap(signUpEntity.toJson()));
      logger.d(response.data);
      return RegistrationResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(UrlConfig.login, RequestMethod.post,
          data: FormData.fromMap(loginEntity.toJson()));
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DeleteAccountResponseModel> deleteAccouunt() async {
    try {
      final response = await _service.call(UrlConfig.deleteAccount, RequestMethod.delete,);
      logger.d(response.data);
      return DeleteAccountResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<OtpResponseModel> otp(OtpEntityModel otpEntity) async {
    try {
      final response = await _service.call(UrlConfig.otp, RequestMethod.post,
          data: FormData.fromMap(otpEntity.toJson()));
      logger.d(response.data);
      return OtpResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<RecentOtpResponseModel> resendOtp(
      ResentOtpEntityModel resendOtpEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.resend_otp, RequestMethod.post,
          data: FormData.fromMap(resendOtpEntity.toJson()));
      logger.d(response.data);
      return RecentOtpResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetProfileResponseModel> getProfile() async {
    try {
      final response = await _service.call(
        UrlConfig.profile,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetProfileResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetCountryModel> country({String? country, String? page}) async {
    try {
      final response = await _service.call(UrlConfig.country, RequestMethod.get,
          data: {"name": country, "page": page});
      logger.d(response.data);
      return GetCountryModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetStateResponseModel> state({String? state, String? page}) async {
    try {
      final response = await _service.call(UrlConfig.state, RequestMethod.get,
          data: {"country": state, "page": page});
      logger.d(response.data);
      return GetStateResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetCitiesResponseModel> city({String? city, String? page}) async {
    try {
      final response = await _service.call(UrlConfig.city, RequestMethod.get,
          data: {"state": city, "page": page});
      logger.d(response.data);
      return GetCitiesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetStatusResponseModel> status(String date) async {
    try {
      final response = await _service
          .call(UrlConfig.get_status, RequestMethod.get, data: {"date": date});
      logger.d(response.data);
      return GetStatusResponseModel.fromJson(response.data);
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

  Future<GetRoomResponseModel> room({String? date, String? id}) async {
    try {
      final response = await _service.call(
          '${UrlConfig.get_room}/$id', RequestMethod.get,
          data: {"date": date});
      logger.d(response.data);
      return GetRoomResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> roomBookings(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.get_room}/$id/bookings', RequestMethod.get);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
