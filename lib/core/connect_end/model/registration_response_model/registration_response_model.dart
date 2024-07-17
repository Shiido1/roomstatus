import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'registration_response_model.g.dart';

@JsonSerializable()
class RegistrationResponseModel {
  bool? success;
  String? message;
  Data? data;

  RegistrationResponseModel({this.success, this.message, this.data});

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegistrationResponseModelToJson(this);
}
