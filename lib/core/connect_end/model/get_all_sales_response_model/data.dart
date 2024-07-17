import 'package:json_annotation/json_annotation.dart';

import 'sale.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	List<Sale>? sales;

	Data({this.sales});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
