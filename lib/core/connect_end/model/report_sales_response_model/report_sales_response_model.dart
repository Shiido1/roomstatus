import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'report_sales_response_model.g.dart';

@JsonSerializable()
class ReportSalesResponseModel {
	bool? success;
	String? message;
	Data? data;

	ReportSalesResponseModel({this.success, this.message, this.data});

	factory ReportSalesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$ReportSalesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ReportSalesResponseModelToJson(this);
}
