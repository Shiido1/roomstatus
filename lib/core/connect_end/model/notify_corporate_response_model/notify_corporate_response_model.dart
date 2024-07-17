import 'package:json_annotation/json_annotation.dart';

part 'notify_corporate_response_model.g.dart';

@JsonSerializable()
class NotifyCorporateResponseModel {
	bool? success;
	String? message;
	dynamic data;

	NotifyCorporateResponseModel({this.success, this.message, this.data});

	factory NotifyCorporateResponseModel.fromJson(Map<String, dynamic> json) {
		return _$NotifyCorporateResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NotifyCorporateResponseModelToJson(this);
}
