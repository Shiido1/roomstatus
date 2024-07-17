import 'package:json_annotation/json_annotation.dart';

part 'payroll_response_model.g.dart';

@JsonSerializable()
class PayrollResponseModel {
	bool? success;
	String? message;
	List<dynamic>? data;

	PayrollResponseModel({this.success, this.message, this.data});

	factory PayrollResponseModel.fromJson(Map<String, dynamic> json) {
		return _$PayrollResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PayrollResponseModelToJson(this);
}
