import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_sales_response_model.g.dart';

@JsonSerializable()
class UpdateSalesResponseModel {
	bool? success;
	String? message;
	Data? data;

	UpdateSalesResponseModel({this.success, this.message, this.data});

	factory UpdateSalesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$UpdateSalesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpdateSalesResponseModelToJson(this);
}
