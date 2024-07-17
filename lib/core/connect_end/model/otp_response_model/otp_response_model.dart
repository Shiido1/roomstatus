import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'otp_response_model.g.dart';

@JsonSerializable()
class OtpResponseModel {
  bool? success;
  String? message;
  Data? data;

  OtpResponseModel({this.success, this.message, this.data});

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$OtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpResponseModelToJson(this);
}
