import 'package:json_annotation/json_annotation.dart';

part 'delete_account_response_model.g.dart';

@JsonSerializable()
class DeleteAccountResponseModel {
	bool? success;
	String? message;
	dynamic data;

	DeleteAccountResponseModel({this.success, this.message, this.data});

	factory DeleteAccountResponseModel.fromJson(Map<String, dynamic> json) {
		return _$DeleteAccountResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DeleteAccountResponseModelToJson(this);
}
