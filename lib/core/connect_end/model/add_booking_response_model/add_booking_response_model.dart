import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'add_booking_response_model.g.dart';

@JsonSerializable()
class AddBookingResponseModel {
  bool? success;
  String? message;
  Data? data;

  AddBookingResponseModel({this.success, this.message, this.data});

  factory AddBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddBookingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddBookingResponseModelToJson(this);
}
