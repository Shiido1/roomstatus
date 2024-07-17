import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'profit_and_loss_repsonse_model.g.dart';

@JsonSerializable()
class ProfitAndLossRepsonseModel {
	bool? success;
	String? message;
	Data? data;

	ProfitAndLossRepsonseModel({this.success, this.message, this.data});

	factory ProfitAndLossRepsonseModel.fromJson(Map<String, dynamic> json) {
		return _$ProfitAndLossRepsonseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ProfitAndLossRepsonseModelToJson(this);
}
