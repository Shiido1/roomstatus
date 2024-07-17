import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_booking_response_model.g.dart';

@JsonSerializable()
class UpdateBookingResponseModel {
	bool? success;
	String? message;
	Data? data;

	UpdateBookingResponseModel({this.success, this.message, this.data});

	factory UpdateBookingResponseModel.fromJson(Map<String, dynamic> json) {
		return _$UpdateBookingResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpdateBookingResponseModelToJson(this);
}
