import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'links.dart';
import 'meta.dart';

part 'get_all_sales_response_model.g.dart';

@JsonSerializable()
class GetAllSalesResponseModel {
	Data? data;
	Links? links;
	Meta? meta;

	GetAllSalesResponseModel({this.data, this.links, this.meta});

	factory GetAllSalesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$GetAllSalesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetAllSalesResponseModelToJson(this);
}
