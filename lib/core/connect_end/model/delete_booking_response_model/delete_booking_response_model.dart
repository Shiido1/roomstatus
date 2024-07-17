import 'package:json_annotation/json_annotation.dart';

part 'delete_booking_response_model.g.dart';

@JsonSerializable()
class DeleteBookingResponseModel {
  bool? success;
  String? message;
  dynamic data;

  DeleteBookingResponseModel({this.success, this.message, this.data});

  factory DeleteBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteBookingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteBookingResponseModelToJson(this);
}
