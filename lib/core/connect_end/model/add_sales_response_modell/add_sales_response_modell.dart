import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'add_sales_response_modell.g.dart';

@JsonSerializable()
class AddSalesResponseModell {
	bool? success;
	String? message;
	Data? data;

	AddSalesResponseModell({this.success, this.message, this.data});

	factory AddSalesResponseModell.fromJson(Map<String, dynamic> json) {
		return _$AddSalesResponseModellFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AddSalesResponseModellToJson(this);
}
