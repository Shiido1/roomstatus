import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'show_booking_response_model.g.dart';

@JsonSerializable()
class ShowBookingResponseModel {
	bool? success;
	String? message;
	Data? data;

	ShowBookingResponseModel({this.success, this.message, this.data});

	factory ShowBookingResponseModel.fromJson(Map<String, dynamic> json) {
		return _$ShowBookingResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ShowBookingResponseModelToJson(this);
}
