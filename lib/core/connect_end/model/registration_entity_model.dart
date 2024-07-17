import 'package:dio/dio.dart';

class RegistrationEntityModel {
  String? name;
  String? address;
  String? countryId;
  String? stateId;
  String? cityId;
  String? telephone;
  String? email;
  String? firstname;
  String? lastname;
  String? password;
  String? passwordConfirmation;
  MultipartFile? logo;

  RegistrationEntityModel({
    this.name,
    this.address,
    this.countryId,
    this.stateId,
    this.cityId,
    this.telephone,
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.passwordConfirmation,
    this.logo,
  });

  factory RegistrationEntityModel.fromJson(Map<String, dynamic> json) {
    return RegistrationEntityModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
      cityId: json['city_id'] as String?,
      telephone: json['telephone'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'country_id': countryId,
        'state_id': stateId,
        'city_id': cityId,
        'telephone': telephone,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'logo': logo,
      };
}
