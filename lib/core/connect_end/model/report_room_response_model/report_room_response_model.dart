import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'report_room_response_model.g.dart';

@JsonSerializable()
class ReportRoomResponseModel {
	bool? success;
	String? message;
	Data? data;

	ReportRoomResponseModel({this.success, this.message, this.data});

	factory ReportRoomResponseModel.fromJson(Map<String, dynamic> json) {
		return _$ReportRoomResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ReportRoomResponseModelToJson(this);
}
