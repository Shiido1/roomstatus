import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'recent_otp_response_model.g.dart';

@JsonSerializable()
class RecentOtpResponseModel {
  bool? success;
  String? message;
  Data? data;

  RecentOtpResponseModel({this.success, this.message, this.data});

  factory RecentOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RecentOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecentOtpResponseModelToJson(this);
}
